defmodule ReportsGenerator do
  def build(filename) do
    case File.read("reports/#{filename}") do
      {:ok, result} ->
        result

      {:error, reason} ->
        reason
        # Default
        # _ -> "caso qualquer"
    end
  end

  def build_2(filename) do
    "reports/#{filename}"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, file_content}), do: file_content
  defp handle_file({:error, _reason}), do: "Error while open file!"
end
