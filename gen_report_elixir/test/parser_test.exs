defmodule ReportsGeneratorElixir.ParserTest do
  use ExUnit.Case

  alias GenReportElixir.Parser

  describe "parser_file/1" do
    test "parser the file" do
      file_name = "gen_report_test.csv"

      response =
        file_name
        |> Parser.parser_file()
        |> Enum.map(& &1)

      expected_response = [
        ["daniele", 7, 29, 4, 2018],
        ["danilo", 1, 7, 4, 2018],
        ["giuliano", 4, 24, 5, 2020],
        ["rafael", 7, 1, 7, 2017]
      ]

      assert response == expected_response
    end
  end
end
