defmodule ListFilter do
  def call(list),
    do: Enum.count(get_numbers_value(list), fn element -> is_odd(element) end)

  defp get_numbers_value(list) do
    Enum.flat_map(list, fn string ->
      case Integer.parse(string) do
        {int, _rest} -> [int]
        # skip value
        :error -> []
      end
    end)
  end

  defp is_odd(element) do
    rem(element, 2) == 1
  end
end
