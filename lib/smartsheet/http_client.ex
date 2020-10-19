defmodule Smartsheet.HttpClient do
  alias Smartsheet.ClientBehaviour

  use HTTPoison.Base

  @smartsheet_api_version "2.0"
  @base_url "https://api.smartsheet.com"

  @behaviour ClientBehaviour

  @impl ClientBehaviour
  def add_webhook(attributes) do
    case post("/webhooks", attributes, "Content-Type": "application/json") do
      {:ok, response = %HTTPoison.Response{}} ->
        Smartsheet.ParseResponse.parse(__ENV__.function, response)

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:internal_error, reason}
    end
  end

  @impl ClientBehaviour
  def update_webhook(webhook_id, attributes) do
    path = "/webhooks/#{webhook_id}"

    case put(path, attributes, "Content-Type": "application/json") do
      {:ok, response = %HTTPoison.Response{}} ->
        Smartsheet.ParseResponse.parse(__ENV__.function, response)

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:internal_error, reason}
    end
  end

  @impl ClientBehaviour
  def delete_webhook(webhook_id) do
    path = "/webhooks/#{webhook_id}"

    case delete(path, "Content-Type": "application/json") do
      {:ok, response = %HTTPoison.Response{}} ->
        Smartsheet.ParseResponse.parse(__ENV__.function, response)

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:internal_error, reason}
    end
  end

  @impl ClientBehaviour
  def list_webhooks() do
    path = "/webhooks"

    case get(path, "Content-Type": "application/json") do
      {:ok, response = %HTTPoison.Response{}} ->
        Smartsheet.ParseResponse.parse(__ENV__.function, response)

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:internal_error, reason}
    end
  end

  @impl ClientBehaviour
  def get_sheet(sheet_id, options \\ []) do
    case get("/sheets/#{sheet_id}", [], params: options) do
      {:ok, response = %HTTPoison.Response{}} ->
        Smartsheet.ParseResponse.parse(__ENV__.function, response)

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:internal_error, reason}
    end
  end

  @impl ClientBehaviour
  def create_sheet(attributes) do
    case post("/sheets", attributes, "Content-Type": "application/json") do
      {:ok, response = %HTTPoison.Response{}} ->
        Smartsheet.ParseResponse.parse(__ENV__.function, response)

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:internal_error, reason}
    end
  end

  @impl ClientBehaviour
  def get_columns(sheet_id, options \\ []) do
    case get("/sheets/#{sheet_id}/columns", [], params: options) do
      {:ok, response = %HTTPoison.Response{}} ->
        Smartsheet.ParseResponse.parse(__ENV__.function, response)

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:internal_error, reason}
    end
  end

  @impl ClientBehaviour
  def add_rows(sheet_id, rows) do
    path = "/sheets/#{sheet_id}/rows"

    case post(path, rows, "Content-Type": "application/json") do
      {:ok, %HTTPoison.Response{} = response} ->
        Smartsheet.ParseResponse.parse(__ENV__.function, response)

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:internal_error, reason}
    end
  end

  @impl ClientBehaviour
  def update_rows(sheet_id, rows) do
    path = "/sheets/#{sheet_id}/rows"

    case put(path, rows, "Content-Type": "application/json") do
      {:ok, response = %HTTPoison.Response{}} ->
        Smartsheet.ParseResponse.parse(__ENV__.function, response)

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:internal_error, reason}
    end
  end

  @impl ClientBehaviour
  def get_row(sheet_id, row_id) do
    path = "/sheets/#{sheet_id}/rows/#{row_id}"

    case get(path, "Content-Type": "application/json") do
      {:ok, response = %HTTPoison.Response{}} ->
        Smartsheet.ParseResponse.parse(__ENV__.function, response)

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

  @impl HTTPoison.Base
  def process_request_headers(headers) do
    [{:Authorization, "Bearer #{api_key()}"} | headers]
  end

  @impl HTTPoison.Base
  def process_response_body(body) do
    body
    |> Poison.decode!()
    |> Recase.Enumerable.convert_keys(&Recase.to_snake/1)
    |> Smartsheet.Util.AtomizeKeys.atomize_keys()
  end

  defp api_key() do
    Application.get_env(:smartsheet, :api_key) ||
      System.get_env("SMARTSHEET_API_KEY")
  end
end
