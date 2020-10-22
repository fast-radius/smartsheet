defmodule Smartsheet.HttpClient do
  alias Smartsheet.ClientBehaviour

  use HTTPoison.Base

  @smartsheet_api_version "2.0"
  @base_url "https://api.smartsheet.com"

  @behaviour ClientBehaviour

  @impl ClientBehaviour
  def add_webhook(attributes) do
    post("/webhooks", attributes, "Content-Type": "application/json")
    |> handle_response(__ENV__.function)
  end

  @impl ClientBehaviour
  def list_webhooks() do
    get("/webhooks")
    |> handle_response(__ENV__.function)
  end

  @impl ClientBehaviour
  def update_webhook(webhook_id, attributes) do
    put("/webhooks/#{webhook_id}", attributes, "Content-Type": "application/json")
    |> handle_response(__ENV__.function)
  end

  @impl ClientBehaviour
  def delete_webhook(webhook_id) do
    delete("/webhooks/#{webhook_id}")
    |> handle_response(__ENV__.function)
  end

  @impl ClientBehaviour
  def create_sheet(attributes) do
    post("/sheets", attributes, "Content-Type": "application/json")
    |> handle_response(__ENV__.function)
  end

  @impl ClientBehaviour
  def get_sheet(sheet_id, params \\ []) do
    get("/sheets/#{sheet_id}", [], params: params)
    |> handle_response(__ENV__.function)
  end

  @impl ClientBehaviour
  def get_columns(sheet_id, params \\ []) do
    get("/sheets/#{sheet_id}/columns", [], params: params)
    |> handle_response(__ENV__.function)
  end

  @impl ClientBehaviour
  def add_rows(sheet_id, rows) do
    post("/sheets/#{sheet_id}/rows", rows, "Content-Type": "application/json")
    |> handle_response(__ENV__.function)
  end

  @impl ClientBehaviour
  def get_row(sheet_id, row_id) do
    get("/sheets/#{sheet_id}/rows/#{row_id}")
    |> handle_response(__ENV__.function)
  end

  @impl ClientBehaviour
  def update_rows(sheet_id, rows) do
    put("/sheets/#{sheet_id}/rows", rows, "Content-Type": "application/json")
    |> handle_response(__ENV__.function)
  end

  @impl ClientBehaviour
  def delete_rows(sheet_id, row_ids) do
    row_ids = Enum.join(row_ids, ",")

    delete("/sheets/#{sheet_id}/rows", [], params: [ids: row_ids])
    |> handle_response(__ENV__.function)
  end

  defp handle_response(response, function) do
    case response do
      {:ok, api_response = %HTTPoison.Response{}} ->
        Smartsheet.ParseResponse.parse(function, api_response)

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:internal_error, reason}
    end
  end

  @impl HTTPoison.Base
  def process_request_body(body) do
    request_body =
      cond do
        is_binary(body) ->
          body

        true ->
          Smartsheet.Util.StringifyKeys.stringify_keys(body)
          |> Recase.Enumerable.convert_keys(&Recase.to_camel/1)
      end

    Poison.encode!(request_body)
  end

  @impl HTTPoison.Base
  def process_request_url(path) do
    URI.merge(
      @base_url,
      @smartsheet_api_version <> path
    )
    |> URI.to_string()
  end

  @api_key Application.get_env(:smartsheet, :api_key) || System.get_env("SMARTSHEET_API_KEY")
  @impl HTTPoison.Base
  def process_request_headers(headers) do
    [{:Authorization, "Bearer #{@api_key}"} | headers]
  end

  @response_timeout Application.get_env(:smartsheet, :response_timeout) || 5000
  @impl HTTPoison.Base
  def process_request_options(options) do
    [{:recv_timeout, @response_timeout} | options]
  end

  @impl HTTPoison.Base
  def process_response_body(body) do
    body
    |> Poison.decode!()
    |> Recase.Enumerable.convert_keys(&Recase.to_snake/1)
    |> Smartsheet.Util.AtomizeKeys.atomize_keys()
  end
end
