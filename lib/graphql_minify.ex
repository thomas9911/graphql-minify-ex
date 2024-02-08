defmodule GraphQLMinify do
  @moduledoc """
  Minify graphql
  """

  @doc """
  minifies graphql

  ```elixir
  iex> GraphQLMinify.minify("{     results             }")
  {:ok, "{results}"}

  iex> GraphQLMinify.minify("${}")
  {:error, %GraphQLMinify.Exception{message: "unknown token"}}
  ```
  """
  @spec minify(binary) :: {:ok, binary} | {:error, GraphQLMinify.Exception.t()}
  defdelegate minify(gql), to: GraphQLMinify.Native

  @doc """
  minifies graphql but raises on exception

  ```elixir
  iex> GraphQLMinify.minify!("{     results             }")
  "{results}"
  ```
  """
  @spec minify!(binary) :: binary
  def minify!(gql) do
    case minify(gql) do
      {:ok, result} -> result
      {:error, exception} -> raise exception
    end
  end
end
