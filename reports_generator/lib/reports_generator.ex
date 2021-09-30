defmodule ReportsGenerator do
  def build(filename) do
    "reports/#{filename}"
    |> File.stream!()
    |> Enum.reduce(report_acc(), fn line, report ->
      [id, _food_name, price] = parser_line(line)
      Map.put(report, id, report[id] + price)
    end)
  end

  defp parser_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(2, &String.to_integer/1)
  end

  defp report_acc(), do: Enum.into(1..30, %{}, fn elem -> {Integer.to_string(elem), 0} end)

  def build_2(filename) do
    case File.read("reports/#{filename}") do
      {:ok, result} ->
        result

      {:error, reason} ->
        reason
        # Default
        # _ -> "caso qualquer"
    end
  end

  def build_3(filename) do
    "reports/#{filename}"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, file_content}), do: file_content
  defp handle_file({:error, _reason}), do: "Error while open file!"
end
