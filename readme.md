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

**Node**

- Lendo arquivo "reports_complete.csv" => 353.304ms
- Lendo arquivos "reports_1.csv", "reports_2.csv", "reports_3.csv" => 370.126ms

**Elixir**

- Lendo arquivo "reports_complete.csv" => 487.936ms
- Lendo arquivos (`multithread`) "reports_1.csv", "reports_2.csv", "reports_3.csv" => 202.854ms
