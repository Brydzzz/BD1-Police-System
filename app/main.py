from datetime import datetime
from dbManager import dbManager, TABLE_NAMES
from rich.prompt import IntPrompt, Prompt
from rich import print

USER_ACTIONS = {
    1: "Display table.",
    2: "Count crimes for a criminal.",
    3: "Number of crimes for a year.",
    4: "Show criminal records between dates",
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
            case 0:
                break
            case _:
                print("Option not recognized.")

    dbm.close_connection()
