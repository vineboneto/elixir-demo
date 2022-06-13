# Anotações Elixir

## Executar modulo em elixir

```shell
$ iex.bat -S mix
```

## Instalar dependências

```shell
$ mix deps.get
```

## Executar teste

```shell
$ mix test
```

## Úteis

```shell
# gera arquivo de config do credo
$ mix credo gen.config
```

## Medição de tempo de execução calculo de tempo em elixir

```bash
:timer(fn -> () end)
```

---

## Realizando relatório em Arquivo CSV

> ReportsComplete's, Reports...N

**Node**

- Lendo arquivo (`event_loop`) "reports_complete.csv" => 353.304ms
- Lendo arquivos (`event_loop`) "reports_1.csv", "reports_2.csv", "reports_3.csv" => 370.126ms

**Elixir**

- Lendo arquivo "reports_complete.csv" => 487.936ms
- Lendo arquivos (`multithread`) "reports_1.csv", "reports_2.csv", "reports_3.csv" => 202.854ms

**Python**

- Lendo arquivo "reports_complete.csv" => 193.236ms

> GenReport

**Elixir**

- Lendo arquivo "gen_report.csv" => 104.448ms
- Lendo arquivos (`multithread`) "part_1.csv", "part_2.csv", "part_3.csv" 28.262ms
