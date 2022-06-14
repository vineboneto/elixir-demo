defmodule ExplaneTest do
  use ExUnit.Case
  doctest Explane

  test "greets the world" do
    assert Explane.hello() == :world
  end
end
