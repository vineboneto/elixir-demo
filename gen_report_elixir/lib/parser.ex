defmodule GenReportElixir.Parser do
  def parser_file(filename) do
    "../reports/#{filename}"
    |> File.stream!()
    |> Stream.map(fn line -> parser_line(line) end)
  end

  defp parser_line(line) do
    line
    |> String.trim()
    |> String.split(",")
    |> List.update_at(0, &String.downcase/1)
    |> List.update_at(1, &String.to_integer/1)
    |> List.update_at(2, &String.to_integer/1)
    |> List.update_at(3, &String.to_integer/1)
    |> List.update_at(4, &String.to_integer/1)
  end
end
