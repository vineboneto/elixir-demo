defmodule Explane.MixProject do
  use Mix.Project

  def project do
    [
      app: :explane,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:decimal, "~> 2.0"},
      {:ex_machina, "~> 2.7.0"},
      {:elixir_uuid, "~> 1.2"}
    ]
  end
end