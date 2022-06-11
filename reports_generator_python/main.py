import time
import pandas as pd


file_complete = "report_complete.csv"
available_users = [i + 1 for i in range(30)]
available_foods = ["açaí", "churrasco", "esfirra", "hambúrguer", "pastel", "pizza", "prato_feito", "sushi"]


def display(foods, users):
    print(users)
    print(foods)


def sum_values(path):
    df = pd.read_csv(path, names=["user", "food", "price"])

    foods = [df.loc[df["food"] == food] for food in available_foods]

    foods_sum = [(len(food), food.iloc[0, 1]) for food in foods]

    users = [df.loc[df["user"] == user] for user in available_users]

    users_sum = [(sum(user["price"]), user.iloc[0, 0]) for user in users]

    return foods_sum, users_sum


def execute(path=f"../reports/{file_complete}"):
    start_time = time.time()
    foods_sum, users_sum = sum_values(path)
    end_time = time.time()
    display(foods_sum, users_sum)
    print("total_time: ", (end_time - start_time) * 1000)


if __name__ == "__main__":
    execute()
