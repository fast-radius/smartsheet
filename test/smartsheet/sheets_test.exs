defmodule Smartsheet.SheetsTest do
  use ExUnit.Case

  @moduledoc """
  General tests that the module can invoke the client and parse a response.
  More robust testing for different possible API responses (success, failure)
  are covered by Smartsheet.ParseResponse and the corresponding test.
  """

  describe "get/2" do
    test "it returns the sheet and a wrapped response" do
      assert {:ok, %Smartsheet.Response{}, %Smartsheet.Sheet{}} = Smartsheet.Sheets.get(1)
    end
  end

  describe "create/1" do
    test "it returns the sheet and a wrapped response" do
      attributes = Smartsheet.MockClient.RequestFixtures.create_sheet_success()

      assert {:ok, %Smartsheet.Response{}, %Smartsheet.Sheet{}} =
               Smartsheet.Sheets.create(attributes)
    end
  end
end
