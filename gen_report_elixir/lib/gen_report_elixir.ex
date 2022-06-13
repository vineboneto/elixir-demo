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

  @available_person [
    "cleiton",
    "daniele",
    "danilo",
    "diego",
    "giuliano",
    "jakeliny",
    "joseph",
    "mayk",
    "rafael",
    "vinicius"
  ]

  def build(filename) do
    filename
    |> Parser.parser_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  def build_from_many(filenames) do
    filenames
    |> Task.async_stream(fn filename -> build(filename) end)
    |> Enum.reduce(report_acc(), fn {:ok, result}, report ->
      sum_reports(report, result)
    end)
  end

  def find_unique_name(filename) do
    filename
    |> Parser.parser_file()
    |> Enum.map(fn [name, _hours, _day, _month, _year] -> name end)
    |> Enum.uniq()
  end

  defp sum_reports(
         %{
           "all_hours" => all_hours1,
           "hours_per_month" => hours_per_month1,
           "hours_per_year" => hours_per_year1
         },
         %{
           "all_hours" => all_hours2,
           "hours_per_month" => hours_per_month2,
           "hours_per_year" => hours_per_year2
         }
       ) do
    all_hours = merge_maps(all_hours1, all_hours2)
    hours_per_month = merge_map_n(hours_per_month1, hours_per_month2)
    hours_per_year = merge_map_n(hours_per_year1, hours_per_year2)

    build_report(all_hours, hours_per_month, hours_per_year)
  end

  defp merge_map_n(map1, map2) do
    Map.merge(map1, map2, fn _k, value1, value2 ->
      merge_maps(value1, value2)
    end)
  end

  defp merge_maps(map1, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
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

  defp report_acc() do
    all_hours = Enum.into(@available_person, %{}, fn elem -> {elem, 0} end)
    hours_per_month = Enum.into(@available_person, %{}, fn elem -> {elem, build_month()} end)
    hours_per_year = Enum.into(@available_person, %{}, fn elem -> {elem, build_year()} end)

    build_report(all_hours, hours_per_month, hours_per_year)
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
