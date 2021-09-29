defmodule ListLength do
  def call(list), do: length(list, 0)

  defp length([], count), do: count

  defp length([_ | tail], count) do
    length(tail, count + 1)
  end
end
