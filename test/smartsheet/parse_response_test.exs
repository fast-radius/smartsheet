defmodule Smartsheet.ParseResponseTest do
  use ExUnit.Case

  alias Smartsheet.MockClient.ResponseFixtures
  alias Smartsheet.ParseResponse

  describe ":get_sheet" do
    test "success" do
      {:ok, raw_http_response} = ResponseFixtures.get_sheet_success()
      wrapped_response = ParseResponse.parse({:get_sheet, 1}, raw_http_response)

      assert {:ok, %Smartsheet.Response{}, sheet = %Smartsheet.Sheet{}} = wrapped_response
      assert sheet.access_level == "OWNER"
      assert Enum.all?(sheet.columns, fn col -> match?(%Smartsheet.Column{}, col) end)
    end

    test "failure" do
      {:ok, raw_http_response} = ResponseFixtures.get_sheet_failure()
      wrapped_response = ParseResponse.parse({:get_sheet, 1}, raw_http_response)

      assert {:error, %Smartsheet.Response{}} = wrapped_response
    end
  end

  describe ":create_sheet" do
    test "success" do
      {:ok, raw_http_response} = ResponseFixtures.create_sheet_success()
      wrapped_response = ParseResponse.parse({:create_sheet, 1}, raw_http_response)

      assert {:ok, %Smartsheet.Response{}, sheet = %Smartsheet.Sheet{}} = wrapped_response
      assert sheet.access_level == "OWNER"
      assert Enum.all?(sheet.columns, fn col -> match?(%Smartsheet.Column{}, col) end)
    end

    test "failure" do
      {:ok, raw_http_response} = ResponseFixtures.create_sheet_failure()
      wrapped_response = ParseResponse.parse({:create_sheet, 1}, raw_http_response)

      assert {:error, %Smartsheet.Response{}} = wrapped_response
    end
  end

  describe ":add_rows" do
    test "success" do
      {:ok, raw_http_response} = ResponseFixtures.add_rows_success([%{locked_for_user: false}])

      wrapped_response = ParseResponse.parse({:add_rows, 1}, raw_http_response)

      assert {:ok, %Smartsheet.Response{}, rows} = wrapped_response

      first_row = List.first(rows)
      assert first_row.locked_for_user == false

      assert Enum.all?(rows, fn row -> match?(%Smartsheet.Row{}, row) end)
    end

    test "failure" do
      {:ok, raw_http_response} = ResponseFixtures.add_rows_failure()

      wrapped_response = ParseResponse.parse({:add_rows, 1}, raw_http_response)

      assert {:error, %Smartsheet.Response{}} = wrapped_response
    end
  end

  describe ":update_rows" do
    test "success" do
      {:ok, raw_http_response} =
        ResponseFixtures.update_rows_success([%{id: 1, locked_for_user: false}])

      wrapped_response = ParseResponse.parse({:update_rows, 1}, raw_http_response)

      assert {:ok, %Smartsheet.Response{}, rows} = wrapped_response

      first_row = List.first(rows)
      assert first_row.locked_for_user == false

      assert Enum.all?(rows, fn row -> match?(%Smartsheet.Row{}, row) end)
    end

    test "failure" do
      {:ok, raw_http_response} = ResponseFixtures.update_rows_failure()
      wrapped_response = ParseResponse.parse({:update_rows, 1}, raw_http_response)

      assert {:error, %Smartsheet.Response{}} = wrapped_response
    end
  end

  describe ":get_row" do
    test "success" do
      {:ok, raw_http_response} = ResponseFixtures.get_row_success()

      wrapped_response = ParseResponse.parse({:get_row, 1}, raw_http_response)

      assert {:ok, %Smartsheet.Response{},
              %Smartsheet.Row{
                id: 2_361_756_178_769_796,
                cells: [%Smartsheet.Cell{value: "Revision 1"}]
              }} = wrapped_response
    end

    test "failure" do
      {:ok, raw_http_response} = ResponseFixtures.get_row_failure()
      wrapped_response = ParseResponse.parse({:get_row, 1}, raw_http_response)

      assert {:error, %Smartsheet.Response{}} = wrapped_response
    end
  end

  describe ":add_webhook" do
    test "success" do
      {:ok, raw_http_response} = ResponseFixtures.create_webhook_success()

      wrapped_response = ParseResponse.parse({:add_webhook, 1}, raw_http_response)

      assert {:ok, %Smartsheet.Response{}, %Smartsheet.Webhook{}} = wrapped_response
    end

    test "failure" do
      {:ok, raw_http_response} = ResponseFixtures.create_webhook_failure()
      wrapped_response = ParseResponse.parse({:add_webhook, 1}, raw_http_response)

      assert {:error, %Smartsheet.Response{}} = wrapped_response
    end
  end

  describe ":update_webhook" do
    test "success" do
      {:ok, raw_http_response} = ResponseFixtures.update_webhook_success()

      wrapped_response = ParseResponse.parse({:update_webhook, 1}, raw_http_response)

      assert {:ok, %Smartsheet.Response{}, %Smartsheet.Webhook{enabled: true}} = wrapped_response
    end

    test "failure" do
      {:ok, raw_http_response} = ResponseFixtures.update_webhook_failure()
      wrapped_response = ParseResponse.parse({:update_webhook, 1}, raw_http_response)

      assert {:error, %Smartsheet.Response{}} = wrapped_response
    end
  end

  describe ":delete_webhook" do
    test "success" do
      {:ok, raw_http_response} = ResponseFixtures.update_webhook_success()

      wrapped_response = ParseResponse.parse({:delete_webhook, 1}, raw_http_response)

      assert {:ok, %Smartsheet.Response{}, %{}} = wrapped_response
    end

    test "failure" do
      {:ok, raw_http_response} = ResponseFixtures.delete_webhook_failure()
      wrapped_response = ParseResponse.parse({:delete_webhook, 1}, raw_http_response)

      assert {:error, %Smartsheet.Response{}} = wrapped_response
    end
  end

  describe ":list_webhooks" do
    test "success" do
      {:ok, raw_http_response} = ResponseFixtures.list_webhooks_success()

      wrapped_response = ParseResponse.parse({:list_webhooks, 1}, raw_http_response)

      assert {:ok, %Smartsheet.Response{}, [%Smartsheet.Webhook{}]} = wrapped_response
    end

    test "failure" do
      {:ok, raw_http_response} = ResponseFixtures.list_webhooks_failure()
      wrapped_response = ParseResponse.parse({:list_webhooks, 1}, raw_http_response)

      assert {:error, %Smartsheet.Response{}} = wrapped_response
    end
  end
end
