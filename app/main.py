from datetime import datetime
from dbManager import dbManager, TABLE_NAMES
from rich.prompt import IntPrompt, Prompt, Confirm
from rich import print

USER_ACTIONS = {
    1: "Display table.",
    2: "Count crimes for a criminal.",
    3: "Number of crimes for a year.",
    4: "Show criminal records between dates",
    5: "Show active cases.",
    6: "Raise salary.",
    7: "Update case end date.",
    8: "Add criminal record.",
    9: "Add criminal.",
    10: "Add address.",
    11: "Add policeman.",
    12: "Add position.",
    0: "Exit.",
}

EXIT = "or -1 to exit"


def get_date_input(prompt_text="Enter a date (DD-MM-YYYY)"):
    while True:
        user_input = Prompt.ask(prompt_text)
        if user_input == "-1":
            return user_input
        try:
            date_value = datetime.strptime(user_input, "%d-%m-%Y")
            return date_value.strftime("%d-%m-%Y")
        except ValueError:
            print("[red]Invalid date format! Please use DD-MM-YYYY.[/red]")


if __name__ == "__main__":
    dbm = dbManager()
    print("WELCOME TO POLICE MANAGEMENT SYSTEM")
    table_names_choices = TABLE_NAMES.copy()
    table_names_choices.append("-1")
    while True:
        print("\nAvailable actions: ")
        for no, text in USER_ACTIONS.items():
            print(f"{no}. {text}")
        action = IntPrompt.ask(
            "Choose option",
            choices=[str(key) for key in USER_ACTIONS.keys()],
            show_choices=False,
        )

        match action:
            case 1:
                name = Prompt.ask(
                    f"Specify table {EXIT}",
                    choices=table_names_choices,
                    show_choices=True,
                )
                if name == "-1":
                    continue
                dbm.select_table(name)
            case 2:
                criminal_id = IntPrompt.ask(f"Enter criminal ID {EXIT}")
                if criminal_id == -1:
                    continue
                dbm.count_crimes(criminal_id)
            case 3:
                year = Prompt.ask(f"Enter year {EXIT}")
                if year == "-1":
                    continue
                dbm.crimes_in_year(year)
            case 4:
                start = get_date_input(f"Start date (DD-MM-YYYY) {EXIT}")
                if start == "-1":
                    continue
                end = get_date_input(f"End date (DD-MM-YYYY) {EXIT}")
                if end == "-1":
                    continue
                dbm.cr_records_between_dates(start, end)
            case 5:
                dbm.active_cases()
            case 6:
                dbm.raise_salary()
            case 7:
                end_date = get_date_input(f"End date (DD-MM-YYYY) {EXIT}")
                if end_date == "-1":
                    continue
                case = Prompt.ask(f"Enter assigned case id {EXIT}")
                if case == "-1":
                    continue
                dbm.close_case(case, end_date)
            case 8:
                known_criminal = Confirm.ask(
                    "Is the criminal already in the database?",
                )
                if not known_criminal:
                    print(
                        "[yellow]Please add the criminal to the database"
                        " first![/yellow]"
                    )
                    continue

                known_place = Confirm.ask(
                    "Is the crime place already in the database?",
                )
                if not known_place:
                    print(
                        "[yellow]Please add the crime place to the database"
                        " first![/yellow]"
                    )
                    continue

                crime_date = get_date_input(f"Crime date (DD-MM-YYYY) {EXIT}")
                if crime_date == "-1":
                    continue
                extra_info = Prompt.ask(
                    f"Enter extra info about the crime {EXIT}"
                )
                if extra_info == "-1":
                    continue
                crime_place = IntPrompt.ask(
                    f"Enter crime place ID (address ID) {EXIT}"
                )
                if crime_place == -1:
                    continue
                crime_id = IntPrompt.ask(f"Enter crime ID {EXIT}")
                if crime_id == -1:
                    continue
                criminal_id = IntPrompt.ask(f"Enter criminal ID {EXIT}")
                if criminal_id == -1:
                    continue

                dbm.add_cr(
                    date=crime_date,
                    info=extra_info,
                    crime_place=crime_place,
                    crime_id=crime_id,
                    criminal_id=criminal_id,
                )
            case 9:
                known_place = Confirm.ask(
                    "Is the address already in the database?",
                )
                if not known_place:
                    print(
                        "[yellow]Please add the address to the database"
                        " first![/yellow]"
                    )
                    continue

                name = Prompt.ask(f"Enter criminal's name {EXIT}")
                if name == "-1":
                    continue

                surname = Prompt.ask(f"Enter criminal's surname {EXIT}")
                if surname == "-1":
                    continue

                pesel = Prompt.ask(f"Enter criminal's pesel {EXIT}")
                if pesel == "-1":
                    continue

                birth_date = get_date_input(f"Birth date (DD-MM-YYYY) {EXIT}")
                if birth_date == "-1":
                    continue

                gender = Prompt.ask(
                    f"Enter criminal's gender {EXIT}", choices=["M", "K"]
                )
                if gender == "-1":
                    continue

                address_id = IntPrompt.ask(
                    f"Enter criminal's address ID (address ID) {EXIT}"
                )
                if address_id == -1:
                    continue

                dbm.add_criminal(
                    criminal_name=name,
                    criminal_surname=surname,
                    pesel=pesel,
                    date=birth_date,
                    gender=gender,
                    address_id=address_id,
                )
            case 10:
                street = Prompt.ask(f"Enter street {EXIT}")
                if street == "-1":
                    continue

                postal_code = Prompt.ask(f"Enter postal code {EXIT}")
                if postal_code == "-1":
                    continue

                city = Prompt.ask(f"Enter city {EXIT}")
                if city == "-1":
                    continue

                dbm.add_address(
                    street=street,
                    postal_code=postal_code,
                    city=city,
                )
            case 11:
                known_position = Confirm.ask(
                    "Is the position already in the database?",
                )
                if not known_position:
                    print(
                        "[yellow]Please add the position to the database"
                        " first![/yellow]"
                    )
                    continue

                name = Prompt.ask(f"Enter name {EXIT}")
                if name == "-1":
                    continue

                surname = Prompt.ask(f"Enter surname {EXIT}")
                if surname == "-1":
                    continue

                date_birth = get_date_input(f"Birth date (DD-MM-YYYY) {EXIT}")
                if date_birth == "-1":
                    continue

                employed_date = get_date_input(
                    f"Employed date (DD-MM-YYYY) {EXIT}"
                )
                if employed_date == "-1":
                    continue

                salary = IntPrompt.ask(f"Enter salary {EXIT}")
                if salary == -1:
                    continue

                department_id = IntPrompt.ask(f"Enter department ID {EXIT}")
                if department_id == -1:
                    continue

                position_id = IntPrompt.ask(f"Enter position ID {EXIT}")
                if position_id == -1:
                    continue

                dbm.add_policeman(
                    name=name,
                    surname=surname,
                    date_birth=date_birth,
                    employed_date=employed_date,
                    salary=salary,
                    department_id=department_id,
                    position_id=position_id,
                )
            case 12:
                name = Prompt.ask(f"Enter name {EXIT}")
                if name == "-1":
                    continue

                min_salary = IntPrompt.ask(
                    f"Enter mininimum value of salary {EXIT}"
                )
                if min_salary == -1:
                    continue

                max_salary = IntPrompt.ask(
                    f"Enter maximum value of salary {EXIT}"
                )
                if max_salary == -1:
                    continue

                dbm.add_position(
                    name=name,
                    min_salary=min_salary,
                    max_salary=max_salary,
                )
            case 0:
                break
            case _:
                print("Option not recognized.")

    dbm.close_connection()
