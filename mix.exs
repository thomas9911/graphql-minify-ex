defmodule GraphQLMinify.MixProject do
  use Mix.Project

  @version "0.1.1"
  @source_url "https://github.com/thomas9911/graphql-minify-ex"

  def project do
    [
      app: :graphql_minify,
      version: @version,
      description: "Minify graphql using https://github.com/dan-lee/graphql-minify-rs",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:rustler, "~> 0.30", optional: true},
      {:rustler_precompiled, "~> 0.7"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp aliases do
    [
      format: ["format", "cmd --cd ./native/graphql_minify_native cargo fmt"]
    ]
  end

  defp package do
    [
      files: [
        "lib",
        "native",
        "checksum-*.exs",
        "mix.exs"
      ],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end
end
