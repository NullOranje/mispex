defmodule MISP.MixProject do
  use Mix.Project

  def project do
    [
      app: :mispex,
      description: "A wrapper to interact with MISP's API.",
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      source_url: "https://github.com/FloatingGhost/mispex"
    ]
  end

  def package do
    [
      licenses: ["MIT"],
      links: %{"MISP Project" => "http://misp.software"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.4"},
      {:poison, "~> 3.1"}
    ]
  end
end
