defmodule Smartsheet.HttpClientTest do
  use ExUnit.Case

  alias Smartsheet.HttpClient

  describe "process_request_body/1" do
    test "the body is an empty string" do
      assert "\"\"" == HttpClient.process_request_body("")
    end

    test "it camelizes atom keys and json encodes the request body" do
      body = %{
        cells: [
          %{column_id: 123, value: "Person"},
          %{column_id: 456, value: 21}
        ],
        to_top: true
      }

      encoded =
        "{\"toTop\":true,\"cells\":[{\"value\":\"Person\",\"columnId\":123},{\"value\":21,\"columnId\":456}]}"

      assert encoded == HttpClient.process_request_body(body)
    end

    test "it works for camelized atom keys" do
      body = %{
        cells: [
          %{columnId: 123, value: "Person"},
          %{columnId: 456, value: 21}
        ],
        toTop: true
      }

      encoded =
        "{\"toTop\":true,\"cells\":[{\"value\":\"Person\",\"columnId\":123},{\"value\":21,\"columnId\":456}]}"

      assert encoded == HttpClient.process_request_body(body)
    end

    test "it works for snake cased string keys" do
      body = %{
        "cells" => [
          %{"column_id" => 123, "value" => "Person"},
          %{"column_id" => 456, "value" => 21}
        ],
        "to_top" => true
      }

      encoded =
        "{\"toTop\":true,\"cells\":[{\"value\":\"Person\",\"columnId\":123},{\"value\":21,\"columnId\":456}]}"

      assert encoded == HttpClient.process_request_body(body)
    end

    test "it works for camelized string keys" do
      body = %{
        "cells" => [
          %{"columnId" => 123, "value" => "Person"},
          %{"columnId" => 456, "value" => 21}
        ],
        "toTop" => true
      }

      encoded =
        "{\"toTop\":true,\"cells\":[{\"value\":\"Person\",\"columnId\":123},{\"value\":21,\"columnId\":456}]}"

      assert encoded == HttpClient.process_request_body(body)
    end
  end

  describe "process_request_url/1" do
    test "generates the full URL based on the path" do
      path = "/sheets"

      assert "https://api.smartsheet.com/2.0/sheets" = HttpClient.process_request_url(path)
    end
  end

  describe "process_request_headers/1" do
    test "it appends Authorization Headers" do
      headers = {"Content-Type", "application/json"}

      assert [{:Authorization, "Bearer "} | {"Content-Type", "application/json"}] ==
               HttpClient.process_request_headers(headers)
    end
  end

  describe "process_response_body" do
    test "it snake cases + atomizes the response keys" do
      body =
        "{\"resultCode\":0,\"result\":{\"name\":\"Test Sheet\",\"id\":456,\"columns\":[{\"title\":\"Names\",\"primary\":true,\"id\":123}]},\"message\":\"SUCCESS\"}"

      parsed_body = %{
        message: "SUCCESS",
        result: %{
          columns: [%{id: 123, primary: true, title: "Names"}],
          id: 456,
          name: "Test Sheet"
        },
        result_code: 0
      }

      assert parsed_body == HttpClient.process_response_body(body)
    end

    test "an empty response body" do
      assert %{} == HttpClient.process_response_body("{}")
    end
  end
end
