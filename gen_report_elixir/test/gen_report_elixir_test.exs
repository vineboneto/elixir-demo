defmodule GenReportElixirTest do
  use ExUnit.Case
  doctest GenReportElixir

  describe "build\1" do
    test "When passing file name return a report" do
      file_name = "gen_report_test.csv"
      response = GenReportElixir.build(file_name)

      expected_response = %{
        "all_hours" => %{
          "daniele" => 7,
          "danilo" => 1,
          "giuliano" => 4,
          "rafael" => 7
        },
        "hours_per_month" => %{
          "daniele" => %{
            "abril" => 7,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "danilo" => %{
            "abril" => 1,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "giuliano" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 0,
            "junho" => 0,
            "maio" => 4,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          },
          "rafael" => %{
            "abril" => 0,
            "agosto" => 0,
            "dezembro" => 0,
            "fevereiro" => 0,
            "janeiro" => 0,
            "julho" => 7,
            "junho" => 0,
            "maio" => 0,
            "março" => 0,
            "novembro" => 0,
            "outubro" => 0,
            "setembro" => 0
          }
        },
        "hours_per_year" => %{
          "daniele" => %{
            2016 => 0,
            2017 => 0,
            2018 => 7,
            2019 => 0,
            2020 => 0
          },
          "danilo" => %{
            2016 => 0,
            2017 => 0,
            2018 => 1,
            2019 => 0,
            2020 => 0
          },
          "giuliano" => %{
            2016 => 0,
            2017 => 0,
            2018 => 0,
            2019 => 0,
            2020 => 4
          },
          "rafael" => %{
            2016 => 0,
            2017 => 7,
            2018 => 0,
            2019 => 0,
            2020 => 0
          }
        }
      }

      assert response == expected_response
    end
  end
end
