defmodule GraphQLMinify do
  @moduledoc """
  Minify graphql
  """

  defdelegate minify(gql), to: GraphQLMinify.Native

  def minify!(gql) do
    case minify(gql) do
      {:ok, result} -> result
      {:error, exception} -> raise exception
    end
  end
end
