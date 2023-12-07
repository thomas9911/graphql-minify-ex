defmodule GraphQLMinify.Native do
  @moduledoc false

  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :graphql_minify,
    crate: "graphql_minify_native",
    base_url: "https://github.com/thomas9911/graphql-minify-ex/releases/download/v#{version}",
    force_build: System.get_env("RUSTLER_PRECOMPILATION_GRAPHQL_MINIFY_BUILD") in ["1", "true"],
    targets:
      Enum.uniq(["aarch64-unknown-linux-musl" | RustlerPrecompiled.Config.default_targets()]),
    version: version,
    nif_versions: ["2.16"]

  def minify(_gql), do: :erlang.nif_error(:nif_not_loaded)
end
