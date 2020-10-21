defmodule Smartsheet.MixProject do
  use Mix.Project

  def project do
    [
      app: :smartsheet,
      description: "HTTP wrapper around the Smartsheet API",
      package: package(),
      version: "2.4.0",
      elixir: "~> 1.10",
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
      {:httpoison, "~> 1.6"},
      {:poison, "~> 3.1"},
      {:recase, "0.7.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      name: "smartsheet",
      licenses: ["MIT License"],
      links: %{"GitHub" => "https://github.com/fast-radius/smartsheet"},
      source_url: "https://github.com/fast-radius/smartsheet"
    ]
  end
end
