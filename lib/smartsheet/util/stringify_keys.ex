defmodule Smartsheet.Util.StringifyKeys do
  def stringify_keys(nil), do: nil

  def stringify_keys(struct = %{__struct__: _}) do
    struct
  end

  def stringify_keys(map = %{}) do
    for {key, val} <- map, into: %{} do
      cond do
        is_binary(key) ->
          {key, stringify_keys(val)}

        is_atom(key) ->
          {Atom.to_string(key), stringify_keys(val)}

        true ->
          {stringify_keys(key), stringify_keys(val)}
      end
    end
  end

  def stringify_keys([head | rest]) do
    [stringify_keys(head) | stringify_keys(rest)]
  end

  def stringify_keys(not_a_map) do
    not_a_map
  end
end
