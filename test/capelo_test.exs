defmodule CapeloTest do
  use ExUnit.Case
  doctest Capelo

  test "greets the world" do
    assert Capelo.hello() == :world
  end
end
