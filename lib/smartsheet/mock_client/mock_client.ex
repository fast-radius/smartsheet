defmodule Smartsheet.MockClient do
  def get("/sheets" <> id, _headers, _options) do
    Smartsheet.MockClient.ResponseFixtures.get_sheet_success(id)
  end

  def get("/sheets/failed_id", _header, _options) do
    Smartsheet.MockClient.ResponseFixtures.get_sheet_failure("failed_id")
  end

  def post("/sheets", _attributes, _headers) do
    Smartsheet.MockClient.ResponseFixtures.create_sheet_success()
  end

  def post("/sheets/:id/rows", _attributes, _headers) do
    Smartsheet.MockClient.ResponseFixtures.add_rows_success()
  end

  def post("/sheets/" <> suffix, attributes, headers) do
    case String.split(suffix, "/") do
      [_id, "rows"] ->
        Smartsheet.MockClient.post("/sheets/:id/rows", attributes, headers)

      _ ->
        nil
    end
  end
end
