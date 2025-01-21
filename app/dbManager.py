import oracledb
import os
import datetime
from dotenv import load_dotenv
from rich.console import Console
from rich.table import Table
from rich.text import Text


TABLE_NAMES = [
    "address",
    "station",
    "position",
    "department",
    "policeman",
    "crime",
    "criminal",
    "criminal_record",
]


class dbManager:
    def __init__(self):
        try:
            load_dotenv()

            USER = os.getenv("USER")
            USERPWD = os.getenv("USERPWD")
            HOST = os.getenv("HOST")
            PORT = os.getenv("PORT")
            SERVICE_NAME = os.getenv("SERVICE_NAME")

            params = oracledb.ConnectParams(
                host=HOST, port=PORT, service_name=SERVICE_NAME
            )
            self.connection = oracledb.connect(
                user=USER, password=USERPWD, params=params
            )

            self._cursor = self.connection.cursor()
        except Exception as e:
            print(f"Failed to connect to database: {e}")
        self._rich_console = Console()

    def _do_query(
        self,
        query: str,
        variables: dict,
        fetch_all: bool = True,
        num_rows: int = 20,
    ):
        self._cursor.execute(query, variables)
        if fetch_all:
            results = self._cursor.fetchall()
        else:
            results = self._cursor.fetchmany(size=num_rows)
        columns = [str(col[0]) for col in self._cursor.description]

        return columns, results

    def _exec_func(self, func_name: str, return_type, args: list):
        return self._cursor.callfunc(func_name, return_type, args)

    def _exec_proc(self, proc_name: str):
        return self._cursor.callproc(proc_name)

    def _print_result(self, columns, results, table_title):
        table = Table(*columns, title=table_title)
        for r in results:
            formatted_row = []
            for value in r:
                if isinstance(value, datetime.datetime):
                    formatted_row.append(value.strftime("%d-%m-%Y"))
                else:
                    formatted_row.append(str(value))
            table.add_row(*formatted_row)
        self._rich_console.print(table)

    def close_connection(self):
        self.connection.close()

    def select_table(self, table_name):
        # TODO add option to fetch only first number of rows
        if table_name.lower() not in [t.lower() for t in TABLE_NAMES]:
            print("Invalid table name")
            return

        sql = f"SELECT * FROM {table_name}"
        columns, results = self._do_query(sql, {})
        self._print_result(
            columns, results, table_title=f"{table_name.upper()} DATA"
        )

    def cr_records_between_dates(self, start_date, end_date):
        sql = """select cr.cr_id,
                c3.CRIMINAL_NAME,
                c3.CRIMINAL_SURNAME,
                cr.CRIME_DATE,
                c2.ARTICLE    as article,
                c2.CRIME_NAME as crime_name,
                c2.SEVERITY   as crime_severity,
                cr.EXTRA_INFO,
                a2.STREET     as crime_address,
                a2.CITY       as crime_city
            from criminal_record cr
                    join ADDRESS A2 on cr.CRIME_PLACE = A2.ADDRESS_ID
                    join CRIME C2 on C2.CRIME_ID = cr.CRIME_ID
                    join CRIMINAL C3 on cr.CRIMINAL_ID = C3.CRIMINAL_ID
            where cr.CRIME_DATE between to_date(:date_1, 'DD-MM-YYYY')
            and to_date(:date_2, 'DD-MM-YYYY')
            order by cr.CRIME_DATE desc
            """
        data = dict(date_1=start_date, date_2=end_date)
        columns, results = self._do_query(sql, data)
        self._print_result(
            columns,
            results,
            table_title=f"Criminal Records from {start_date} to {end_date}",
        )

    def close_case(self, assign_case_id, end_date):
        sql = """
            UPDATE ASSIGNED_CASE
            SET END_ASSIGN_DATE = :end_date
            WHERE ASSIGN_ID = :assign_case_id
        """

        self._cursor.execute("BEGIN DBMS_OUTPUT.ENABLE(1000000); END;")
        end_date_obj = datetime.datetime.strptime(end_date, '%d-%m-%Y').date()
        self._cursor.execute(sql, {'end_date': end_date_obj, 'assign_case_id': assign_case_id})
        self.connection.commit()

        self._cursor.execute("BEGIN DBMS_OUTPUT.GET_LINES(:lines, :num_lines); END;", lines=[], num_lines=1000)
        lines = self._cursor.fetchall()

        if lines:
            self._rich_console.print("[bold green]Trigger Output:[/bold green]")
            for line in lines:
                self._rich_console.print(f"[cyan]{line[0]}[/cyan]")

        self._rich_console.print(f"Case with Assign ID {assign_case_id} has been updated with the new end date: {end_date}", style="bold green")

    def count_crimes(self, criminal_id):
        result = self._exec_func("crime_count", int, [criminal_id])

        if result != 0:
            crime_count_text = Text(
                f"Criminal with ID {criminal_id} is"
                f" associated with {result} crime(s).",
                style="bold green",
            )
        else:
            crime_count_text = Text(
                f"No crimes found for Criminal ID {criminal_id}.",
                style="bold red",
            )

        self._rich_console.print(crime_count_text)

    def crimes_in_year(self, year):
        result = self._exec_func("crimes_in_year", int, [year])

        if result != 0:
            crimes_count_text = Text(
                f"Number of crimes in {year} is {result}.", style="bold cyan"
            )
        else:
            crimes_count_text = Text(
                f"No crimes for {year}.", style="bold cyan"
            )

        self._rich_console.print(crimes_count_text)

    def active_cases(self):
        self._cursor.execute("BEGIN DBMS_OUTPUT.ENABLE(1000000); END;")
        self._exec_proc("active_cases")
        self._cursor.execute("BEGIN DBMS_OUTPUT.GET_LINES(:lines, :num_lines); END;",
                             lines=[], num_lines=100)

        lines = self._cursor.fetchall()

        columns = ["Assign ID", "Role", "Start Date", "End Date", "Policeman Name", "Case Date", "Case Info"]
        formatted_results = []

        for line in lines:
            row = line[0].split("\n")
            formatted_results.append(row)

        self._print_result(columns, formatted_results, "Active Cases")

    def raise_salary(self):
        self._cursor.execute("BEGIN DBMS_OUTPUT.ENABLE(1000000); END;")
        self._exec_proc("raise_salary")
        self._cursor.execute("BEGIN DBMS_OUTPUT.GET_LINES(:lines, :num_lines); END;",
                             lines=[], num_lines=1000)

        lines = self._cursor.fetchall()

        if lines:
            self._rich_console.print("[bold green]Salary Raise Procedure Output:[/bold green]")

            for line in lines:
                self._rich_console.print(f"[cyan]{line[0]}[/cyan]")
        else:
            self._rich_console.print("[bold red]No output from the raise salary procedure.[/bold red]")

    def add_cr(self, date, info, crime_place, crime_id, criminal_id):
        crime_date = datetime.datetime.strptime(date, '%d-%m-%Y').date()
        try:
            sql = """
                INSERT INTO CRIMINAL_RECORD (CR_ID, CRIME_DATE, EXTRA_INFO, CRIME_PLACE, CRIME_ID, CRIMINAL_ID)
                VALUES (SEQ_CR_ID.nextval, :crime_date, :extra_info, :crime_place, :crime_id, :criminal_id)
            """
            # Słownik zmiennych musi pasować do nazw w zapytaniu SQL
            data = {
                "crime_date": crime_date,
                "extra_info": info,
                "crime_place": crime_place,
                "crime_id": crime_id,
                "criminal_id": criminal_id,
            }

            self._cursor.execute(sql, data)
            self.connection.commit()

            self._rich_console.print(
                f"[bold green]Criminal record added successfully![/bold green]\n"
                f"[cyan]Date:[/cyan] {date}, [cyan]Info:[/cyan] {info}, "
                f"[cyan]Place ID:[/cyan] {crime_place}, [cyan]Crime ID:[/cyan] {crime_id}, [cyan]Criminal ID:[/cyan] {criminal_id}"
            )
        except oracledb.DatabaseError as e:
            error, = e.args
            self._rich_console.print(
                f"[bold red]Failed to add record: {error.message}[/bold red]"
            )
