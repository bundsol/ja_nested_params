defmodule JaNestedParams.MixProject do
  use Mix.Project

  def project do
    [
      app: :ja_nested_params,
      version: "0.0.1",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description()  ,
      package: 
        [ licenses: ["BSD 3-Clause"],
          files: ["LICENSE"] ,
          links: %{"GitHub" => "https://github.com/bundsol/ja_nested_params.git"}, 
          maintainers: ["Salvador Sanchez"]
        ] ,
      source_url: "https://github.com/bundsol/ja_nested_params.git"
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
  
  defp description do
    "Parser for nested params from Json Api document with `included` object."
  end 
end
