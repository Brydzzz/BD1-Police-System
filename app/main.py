from datetime import datetime
from dbManager import dbManager, TABLE_NAMES
from rich.prompt import IntPrompt, Prompt
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
    0: "Exit.",
}


def get_date_input(prompt_text="Enter a date (DD-MM-YYYY): "):
    while True:
        user_input = Prompt.ask(prompt_text)
        try:
            date_value = datetime.strptime(user_input, "%d-%m-%Y")
            return date_value.strftime("%d-%m-%Y")
        except ValueError:
            print("[red]Invalid date format! Please use DD-MM-YYYY.[/red]")


if __name__ == "__main__":
    dbm = dbManager()
    print("WELCOME TO POLICE MANAGEMENT SYSTEM")  # możesz to zmienić
    while True:
        print("Available actions: ")
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
                    "Specify table", choices=TABLE_NAMES, show_choices=True
                )
                dbm.select_table(name)
            case 2:
                criminal_id = IntPrompt.ask("Enter criminal ID")
                dbm.count_crimes(criminal_id)
            case 3:
                year = Prompt.ask("Enter year")
                dbm.crimes_in_year(year)
            case 4:
                start = get_date_input("Start date (DD-MM-YYYY)")
                end = get_date_input("End date (DD-MM-YYYY)")
                dbm.cr_records_between_dates(start, end)
            case 5:
                dbm.active_cases()
            case 6:
                dbm.raise_salary()
            case 7:
                end_date = get_date_input("End date (DD-MM-YYYY)")
                case = Prompt.ask("Enter assgined case id")
                dbm.close_case(case, end_date)
            case 8:
                known_criminal = Prompt.ask(
                    "Is the criminal already in the database? (yes/no)",
                    choices=["yes", "no"],
                    show_choices=True,
                )
                if known_criminal.lower() == "no":
                    print("[yellow]Please add the criminal to the database first![/yellow]")
                    continue

                known_place = Prompt.ask(
                    "Is the crime place already in the database?",
                    choices=["yes", "no"],
                    show_choices=True,
                )
                if known_place.lower() == "no":
                    print("[yellow]Please add the address to the database first![/yellow]")
                    continue

                crime_date = get_date_input("Crime date (DD-MM-YYYY): ")
                extra_info = Prompt.ask("Enter extra info about the crime")
                crime_place = IntPrompt.ask("Enter crime place ID (address ID)")
                crime_id = IntPrompt.ask("Enter crime ID")
                criminal_id = IntPrompt.ask("Enter criminal ID")

                dbm.add_cr(
                    date=crime_date,
                    info=extra_info,
                    crime_place=crime_place,
                    crime_id=crime_id,
                    criminal_id=criminal_id,
                )
            case 0:
                break
            case _:
                print("Option not recognized.")

    dbm.close_connection()
