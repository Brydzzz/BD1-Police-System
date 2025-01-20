import oracledb
import os
import datetime
from dotenv import load_dotenv
from rich.console import Console
from rich.table import Table


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

    def _print_result(self, columns, results, table_title):
        table = Table(*columns, title=table_title)
        for r in results:
            formatted_row = []
            for value in r:
                if isinstance(value, datetime.datetime):
                    formatted_row.append(value.strftime("%Y-%m-%d"))
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
