defmodule Yodlee.Mixfile do
  use Mix.Project

  def project do
    [app: :yodlee,
     version: "0.1.4",
     elixir: "~> 1.1",
     elixirc_paths: elixirc_paths(Mix.env),
     description: "Yodlee API",
     package: package,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :hackney]]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:httpoison, "~> 0.9.0" },
      {:hackney, "~> 1.4.8" }, # not included in hex version of httpoison :(
      {:poison, "~> 1.5"},
      {:ex_doc, "~> 0.7", only: :dev},
      {:mock, "~> 0.1.1", only: :test}]
  end

    def package do
    [
      maintainers: ["Mike North", "Levanto Financial"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/levanto-financial/yodlee-elixir"}
    ]
  end
end
