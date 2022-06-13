defmodule GenReportElixir do
  alias GenReportElixir.Parser

  @months [
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
    "dezembro"
  ]

  def build(filename) do
    lines = Parser.parser_file(filename)
    Enum.reduce(lines, report_acc(lines), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values(
         [name, hours, _day, month, year],
         %{
           "all_hours" => all_hours,
           "hours_per_month" => hours_per_month,
           "hours_per_year" => hours_per_year
         } = report
       ) do
    all_hours = Map.put(all_hours, name, all_hours[name] + hours)

    month = Enum.at(@months, month - 1)
    months = Map.put(hours_per_month[name], month, hours_per_month[name][month] + hours)
    hours_per_month = Map.put(hours_per_month, name, months)

    years = Map.put(hours_per_year[name], year, hours_per_year[name][year] + hours)
    hours_per_year = Map.put(hours_per_year, name, years)

    report
    |> Map.put("all_hours", all_hours)
    |> Map.put("hours_per_month", hours_per_month)
    |> Map.put("hours_per_year", hours_per_year)
  end

  defp report_acc(lines) do
    names = find_unique_name(lines)
    all_hours = Enum.into(names, %{}, fn elem -> {elem, 0} end)
    hours_per_month = Enum.into(names, %{}, fn elem -> {elem, build_month()} end)
    hours_per_year = Enum.into(names, %{}, fn elem -> {elem, build_year()} end)

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp find_unique_name(lines) do
    lines
    |> Enum.map(fn [name, _hours, _day, _month, _year] -> name end)
    |> Enum.uniq()
  end

  defp build_month() do
    Enum.into(@months, %{}, fn month -> {month, 0} end)
  end

  defp build_year() do
    Enum.into(2016..2020, %{}, fn year -> {year, 0} end)
  end

  defp build_report(all_hours, hours_per_month, hours_per_year),
    do: %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
end
