defmodule ReportsGenerator do
  alias ReportsGenerator.Parser

  def build(filename) do
    filename
    |> Parser.parser_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values([id, _food_name, price], report), do: Map.put(report, id, report[id] + price)

  defp report_acc(), do: Enum.into(1..30, %{}, fn elem -> {Integer.to_string(elem), 0} end)

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
