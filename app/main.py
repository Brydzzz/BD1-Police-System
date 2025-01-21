from dbManager import dbManager, TABLE_NAMES
from rich.prompt import IntPrompt, Prompt

USER_ACTIONS = {1: "Display table.",
                2: "Count crimes for a criminal.",
                0: "Exit."}


if __name__ == "__main__":
    dbm = dbManager()
    print("WELCOME TO POLICE MANAGEMENT SYSTEM")  # możesz to zmienić
    while True:
        print("Available actions: ")
        for no, text in USER_ACTIONS.items():
            print(f"{no}. {text}")
        action = IntPrompt.ask(
            "Choose option: ",
            choices=[str(key) for key in USER_ACTIONS.keys()],
            show_choices=False,
        )

        match action:
            case 1:
                name = Prompt.ask(
                    "Specify table: ", choices=TABLE_NAMES, show_choices=True
                )
                dbm.select_table(name)
            case 2:
                criminal_id = IntPrompt.ask("Enter criminal ID: ")
                dbm.count_crimes(criminal_id)
            case 0:
                break
            case _:
                print("Option not recognized.")

    dbm.close_connection()
