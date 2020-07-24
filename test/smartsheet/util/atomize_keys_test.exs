defmodule Smartsheet.Util.AtomizeKeysTest do
  use ExUnit.Case

  alias Smartsheet.Util.AtomizeKeys

  describe "atomize_keys/1" do
    test "nil" do
      assert is_nil(AtomizeKeys.atomize_keys(nil))
    end

    test "a struct" do
      struct = %Smartsheet.Column{id: 1, primary: true}
      assert %Smartsheet.Column{id: 1, primary: true} = AtomizeKeys.atomize_keys(struct)
    end

    test "a map with a string key" do
      map = %{"number" => 123}
      assert %{number: 123} = AtomizeKeys.atomize_keys(map)
    end

    test "a map with an atom key" do
      map = %{number: 123}
      assert %{number: 123} = AtomizeKeys.atomize_keys(map)
    end

    test "a map with a map key" do
      map = %{%{"thing" => 123} => 456}
      assert %{%{thing: 123} => 456} = AtomizeKeys.atomize_keys(map)
    end

    test "a nested map" do
      map = %{"nested" => %{"number" => 123}}
      assert %{nested: %{number: 123}} = AtomizeKeys.atomize_keys(map)
    end

    test "a list" do
      list = ["a", "b"]
      assert ["a", "b"] = AtomizeKeys.atomize_keys(list)
    end

    test "a list containing a map" do
      list = ["a", "b", %{"number" => 123}]
      assert ["a", "b", %{number: 123}] = AtomizeKeys.atomize_keys(list)
    end

    test "a list containing a nested map" do
      list = ["a", "b", %{"nested" => %{"number" => 123}}]
      assert ["a", "b", %{nested: %{number: 123}}] = AtomizeKeys.atomize_keys(list)
    end
  end
end
