defmodule GraphQLMinifyTest do
  use ExUnit.Case, async: true
  doctest GraphQLMinify

  test "minify graphql" do
    assert {:ok, "{results}"} = GraphQLMinify.minify("{     results     }")
  end

  test "minifiy large graphql" do
    gql = ~s|      """
    Type description
    """
    type Foo {
      """
      Field description
      """
      bar: String
    }|

    expected = ~s|"""Type description""" type Foo{"""Field description""" bar:String}|

    assert {:ok, expected} == GraphQLMinify.minify(gql)
  end

  test "minify graphql error" do
    assert {:error, %GraphQLMinify.Exception{message: "unknown token"}} =
             GraphQLMinify.minify("{  popcorn🍿 }")
  end

  test "minify!" do
    assert "{results}" = GraphQLMinify.minify!("{     results     }")
  end

  test "minify! exception" do
    assert_raise GraphQLMinify.Exception, "unknown token", fn ->
      GraphQLMinify.minify!("{  popcorn🍿 }")
    end
  end
end
