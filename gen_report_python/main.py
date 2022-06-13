import time
import pandas as pd
import json


file_complete = "gen_report.csv"
available_names = [
    "cleiton",
    "daniele",
    "danilo",
    "diego",
    "giuliano",
    "jakeliny",
    "joseph",
    "mayk",
    "rafael",
    "vinicius",
]
available_months = [
    "janeiro",
    "fevereiro",
    "março",
    "abril",
    "maio",
    "junho",
    "julho",
    "agosto",
    "setembro",
    "outubro",
    "novembro",
    "dezembro",
]

available_years = [2016, 2017, 2018, 2019, 2020]


def display(all_hours, hours_per_month, hours_per_year):
    print(
        json.dumps(dict(all_hours=all_hours, hours_per_month=hours_per_month, hours_per_year=hours_per_year), indent=4)
    )


def sum_values(path):
    df = pd.read_csv(path, names=["name", "hour", "day", "month", "year"])
    dataset = [df.loc[df["name"].str.lower() == name] for name in available_names]
    position_name = (0, 0)
    hours_per_month = []
    hours_per_year = []

    all_hours = [{data.iloc[position_name].lower(): sum(data["hour"])} for data in dataset]

    for name in available_names:
        sum_hours = 0
        data = {name: {}}
        for idx, month in enumerate(available_months):
            sum_hours = int(df.loc[(df["name"].str.lower() == name) & (df["month"] == idx + 1), ["hour"]].sum())
            data = {**data, name: {**data.get(name), month: sum_hours}}

        hours_per_month.append(data)

    for name in available_names:
        sum_hours = 0
        data = {name: {}}
        for year in available_years:
            sum_hours = int(df.loc[(df["name"].str.lower() == name) & (df["year"] == year), ["hour"]].sum())
            data = {**data, name: {**data.get(name), year: sum_hours}}

        hours_per_year.append(data)

    return all_hours, hours_per_month, hours_per_year


def execute(path=f"../reports/{file_complete}"):
    start_time = time.time()
    all_hours, hours_per_month, hours_per_year = sum_values(path)
    end_time = time.time()
    print("total_time: ", (end_time - start_time) * 1000)
    display(all_hours, hours_per_month, hours_per_year)


if __name__ == "__main__":
    execute()
