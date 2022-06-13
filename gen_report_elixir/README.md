# GenReport

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `gen_report` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:gen_report, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/gen_report>.

Nesse desafio, você deverá gerar um relatório a partir de um arquivo `.csv`.

Dez pessoas fizeram freelas para uma empresa X durante cinco anos e o histórico com todos os dados de cada uma dessas pessoas (nome, horas trabalhadas, dia, mês e ano) foram passadas para um arquivo CSV na seguinte ordem: nome, horas de trabalho no dia (que vai variar de 1 a 8 hrs), dia (que vai variar de 1 a 30 mesmo para o mês de fevereiro e sem considerar anos bissextos) referente às horas de trabalho, mês e ano (que vai de 2016 a 2020). Resumindo: **nome**, **quantidade de horas**, **dia**, **mês** e **ano**.
O relatório gerado a partir do arquivo (que está disponível para download logo abaixo) deve estar no seguinte formato:

```Elixir
%{
  all_hours: %{
        danilo: 500,
        rafael: 854,
        ...
    },
  hours_per_month: %{
        danilo: %{
            janeiro: 40,
            fevereiro: 64,
            ...
        },
        rafael: %{
            janeiro: 52,
            fevereiro: 37,
            ...
        }
    },
  hours_per_year: %{
        danilo: %{
            2016: 276,
            2017: 412,
            ...
        },
        rafael: %{
            2016: 376,
            2017: 348,
            ...
        }
    }
}
```

## Comandos

```bash

$ GenReportElixir.find_unique_name("gen_report.csv")

$ GenReportElixir.build("gen_report.csv")
$ GenReportElixir.build("gen_report_test.csv")
$ :timer.tc(fn -> GenReportElixir.build("gen_report.csv") end)

$ GenReportElixir.build_from_many(["part_1.csv", "part_2.csv", "part_3.csv"])
$ :timer.tc(fn -> GenReportElixir.build_from_many(["part_1.csv", "part_2.csv", "part_3.csv"]) end)
```

## Resultado

```elixir
%{
  "all_hours" => %{
    "cleiton" => 13797,
    "daniele" => 13264,
    "danilo" => 13583,
    "diego" => 13015,
    "giuliano" => 13671,
    "jakeliny" => 13909,
    "joseph" => 13174,
    "mayk" => 13526,
    "rafael" => 13597,
    "vinicius" => 13412
  },
  "hours_per_month" => %{
    "cleiton" => %{
      "abril" => 1161,
      "agosto" => 1149,
      "dezembro" => 1100,
      "fevereiro" => 1168,
      "janeiro" => 1271,
      "julho" => 1236,
      "junho" => 1123,
      "maio" => 998,
      "março" => 1091,
      "novembro" => 1266,
      "outubro" => 1073,
      "setembro" => 1161
    },
    "daniele" => %{
      "abril" => 1138,
      "agosto" => 1018,
      "dezembro" => 1019,
      "fevereiro" => 1003,
      "janeiro" => 1130,
      "julho" => 1135,
      "junho" => 1092,
      "maio" => 1170,
      "março" => 1177,
      "novembro" => 1131,
      "outubro" => 1046,
      "setembro" => 1205
    },
    "danilo" => %{
      "abril" => 1232,
      "agosto" => 1200,
      "dezembro" => 1149,
      "fevereiro" => 1156,
      "janeiro" => 1121,
      "julho" => 1114,
      "junho" => 966,
      "maio" => 1075,
      "março" => 1096,
      "novembro" => 1122,
      "outubro" => 1237,
      "setembro" => 1115
    },
    "diego" => %{
      "abril" => 1112,
      "agosto" => 1129,
      "dezembro" => 1177,
      "fevereiro" => 1144,
      "janeiro" => 1118,
      "julho" => 1099,
      "junho" => 1073,
      "maio" => 1082,
      "março" => 1029,
      "novembro" => 995,
      "outubro" => 928,
      "setembro" => 1129
    },
    "giuliano" => %{
      "abril" => 1152,
      "agosto" => 1126,
      "dezembro" => 1100,
      "fevereiro" => 1173,
      "janeiro" => 1107,
      "julho" => 1169,
      "junho" => 1197,
      "maio" => 1182,
      "março" => 1097,
      "novembro" => 1105,
      "outubro" => 1123,
      "setembro" => 1140
    },
    "jakeliny" => %{
      "abril" => 1172,
      "agosto" => 1098,
      "dezembro" => 1122,
      "fevereiro" => 1119,
      "janeiro" => 1118,
      "julho" => 1245,
      "junho" => 1182,
      "maio" => 1129,
      "março" => 1178,
      "novembro" => 1085,
      "outubro" => 1197,
      "setembro" => 1264
    },
    "joseph" => %{
      "abril" => 1047,
      "agosto" => 1167,
      "dezembro" => 1122,
      "fevereiro" => 1202,
      "janeiro" => 1084,
      "julho" => 1153,
      "junho" => 1105,
      "maio" => 1082,
      "março" => 1038,
      "novembro" => 1005,
      "outubro" => 1058,
      "setembro" => 1111
    },
    "mayk" => %{
      "abril" => 1016,
      "agosto" => 1079,
      "dezembro" => 1159,
      "fevereiro" => 1085,
      "janeiro" => 1100,
      "julho" => 1093,
      "junho" => 1190,
      "maio" => 1173,
      "março" => 1166,
      "novembro" => 1257,
      "outubro" => 1094,
      "setembro" => 1114
    },
    "rafael" => %{
      "abril" => 1171,
      "agosto" => 1199,
      "dezembro" => 965,
      "fevereiro" => 1042,
      "janeiro" => 1125,
      "julho" => 1097,
      "junho" => 1218,
      "maio" => 1141,
      "março" => 1220,
      "novembro" => 1163,
      "outubro" => 1161,
      "setembro" => 1095
    },
    "vinicius" => %{
      "abril" => 1149,
      "agosto" => 1055,
      "dezembro" => 1186,
      "fevereiro" => 1102,
      "janeiro" => 1036,
      "julho" => 979,
      "junho" => 1213,
      "maio" => 1109,
      "março" => 1191,
      "novembro" => 1169,
      "outubro" => 1113,
      "setembro" => 1110
    }
  },
  "hours_per_year" => %{
    "cleiton" => %{
      2016 => 2699,
      2017 => 2684,
      2018 => 2805,
      2019 => 2714,
      2020 => 2895
    },
    "daniele" => %{
      2016 => 2573,
      2017 => 2862,
      2018 => 2633,
      2019 => 2562,
      2020 => 2634
    },
    "danilo" => %{
      2016 => 2746,
      2017 => 2534,
      2018 => 2972,
      2019 => 2666,
      2020 => 2665
    },
    "diego" => %{
      2016 => 2577,
      2017 => 2647,
      2018 => 2792,
      2019 => 2486,
      2020 => 2513
    },
    "giuliano" => %{
      2016 => 2784,
      2017 => 2696,
      2018 => 2693,
      2019 => 2850,
      2020 => 2648
    },
    "jakeliny" => %{
      2016 => 2869,
      2017 => 2625,
      2018 => 2765,
      2019 => 2709,
      2020 => 2941
    },
    "joseph" => %{
      2016 => 2603,
      2017 => 2617,
      2018 => 2587,
      2019 => 2672,
      2020 => 2695
    },
    "mayk" => %{
      2016 => 2644,
      2017 => 2735,
      2018 => 2770,
      2019 => 2778,
      2020 => 2599
    },
    "rafael" => %{
      2016 => 2684,
      2017 => 2570,
      2018 => 2628,
      2019 => 2786,
      2020 => 2929
    },
    "vinicius" => %{
      2016 => 2530,
      2017 => 2720,
      2018 => 2654,
      2019 => 2640,
      2020 => 2868
    }
  }
}
```
