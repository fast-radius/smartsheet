defmodule Smartsheet.Client do
  use HTTPoison.Base

  @smartsheet_api_version "2.0"
  @base_url "https://api.smartsheet.com"

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

  def process_request_url(path) do
    URI.merge(
      @base_url,
      @smartsheet_api_version <> path
    )
    |> URI.to_string()
  end

  def process_request_headers(headers) do
    [{:Authorization, "Bearer #{api_key()}"} | headers]
  end

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
