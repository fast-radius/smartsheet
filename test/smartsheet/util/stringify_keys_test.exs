defmodule Smartsheet.Util.StringifyKeysTest do
  use ExUnit.Case

  alias Smartsheet.Util.StringifyKeys

  describe "stringify_keys/1" do
    test "nil" do
      assert is_nil(StringifyKeys.stringify_keys(nil))
    end

    test "a struct" do
      struct = %Smartsheet.Column{id: 1, primary: true}
      assert %Smartsheet.Column{id: 1, primary: true} = StringifyKeys.stringify_keys(struct)
    end

    test "a map with an atom key" do
      map = %{number: 123}
      assert %{"number" => 123} = StringifyKeys.stringify_keys(map)
    end

    test "a map with a string key" do
      map = %{"number" => 123}
      assert %{"number" => 123} = StringifyKeys.stringify_keys(map)
    end

    test "a map with a map key" do
      map = %{%{thing: 123} => 456}
      assert %{%{"thing" => 123} => 456} = StringifyKeys.stringify_keys(map)
    end

    test "a map with map keys and map values" do
      map = %{%{thing: 123} => %{other_thing: 456}}
      assert %{%{"thing" => 123} => %{"other_thing" => 456}} = StringifyKeys.stringify_keys(map)
    end

    test "a nested map" do
      map = %{nested: %{number: 123}}
      assert %{"nested" => %{"number" => 123}} = StringifyKeys.stringify_keys(map)
    end

    test "a list" do
      list = ["a", "b"]
      assert ["a", "b"] = StringifyKeys.stringify_keys(list)
    end

    test "a list containing a map" do
      list = ["a", "b", %{number: 123}]
      assert ["a", "b", %{"number" => 123}] = StringifyKeys.stringify_keys(list)
    end

    test "a list containing a nested map" do
      list = ["a", "b", %{nested: %{number: 123}}]
      assert ["a", "b", %{"nested" => %{"number" => 123}}] = StringifyKeys.stringify_keys(list)
    end
  end
end
