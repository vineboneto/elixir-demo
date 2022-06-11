# Help

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `help` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:help, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/help>.

## Execute

**Windows**

```bash
$ iex.bat -S mix
$ :timer.tc(fn -> ReportsGeneratorElixir.build("report_complete.csv") end)
$ :timer.tc(fn -> ReportsGeneratorElixir.build_from_many(["report_1.csv", "report_2.csv", "report_3.csv"]) end)
```
