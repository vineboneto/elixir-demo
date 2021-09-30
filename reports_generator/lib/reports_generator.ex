defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  @avaiable_foods [
    "açaí",
    "churrasco",
    "esfirra",
    "hambúrguer",
    "pastel",
    "pizza",
    "prato_feito",
    "sushi"
  ]

  @options ["foods", "users"]

  def build(filename) do
    filename
    |> Parser.parser_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  def fetch_higher_cost(report, option) when option in @options do
    {:ok, Enum.max_by(report[option], fn {_key, value} -> value end)}
  end

  def fetch_higher_cost(_report, _option), do: {:error, "Invalid option!"}

  defp sum_values([id, food_name, price], %{"foods" => foods, "users" => users} = report) do
    users = Map.put(users, id, users[id] + price)
    foods = Map.put(foods, food_name, foods[food_name] + 1)

    report
    |> Map.put("users", users)
    |> Map.put("foods", foods)
  end

  defp report_acc() do
    foods = Enum.into(@avaiable_foods, %{}, fn elem -> {elem, 0} end)
    users = Enum.into(1..30, %{}, fn elem -> {Integer.to_string(elem), 0} end)

    %{"users" => users, "foods" => foods}
  end

  # def build_2(filename) do
  #   case File.read("reports/#{filename}") do
  #     {:ok, result} ->
  #       result

  #     {:error, reason} ->
  #       reason
  #       # Default
  #       # _ -> "caso qualquer"
  #   end
  # end

  # def build_3(filename) do
  #   "reports/#{filename}"
  #   |> File.read()
  #   |> handle_file()
  # end

  # defp handle_file({:ok, file_content}), do: file_content
  # defp handle_file({:error, _reason}), do: "Error while open file!"
end
