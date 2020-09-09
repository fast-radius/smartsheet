defmodule Smartsheet.RowsTest do
  use ExUnit.Case

  @moduledoc """
  General tests that the module can invoke the client and parse a response.
  More robust testing for different possible API responses (success, failure)
  are covered by Smartsheet.ParseResponse and the corresponding test.
  """

  describe "add_to_sheet/2" do
    test "it returns the rows added and a wrapped response" do
      rows = [%{locked: true}]

      assert {:ok, %Smartsheet.Response{}, response_rows} = Smartsheet.Rows.add_to_sheet(1, rows)

      Enum.each(response_rows, fn row ->
        assert %Smartsheet.Row{} = row
      end)
    end
  end

  describe "update/2" do
    rows = [%{id: 1, locked: true}]

    assert {:ok, %Smartsheet.Response{}, response_rows} = Smartsheet.Rows.update(1, rows)

    Enum.each(response_rows, fn row ->
      assert %Smartsheet.Row{} = row
    end)
  end
end
