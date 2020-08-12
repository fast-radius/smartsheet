defmodule Smartsheet.MockClient do
  def get("/sheets/get_sheet_fail_id", _header, _options) do
    Smartsheet.MockClient.ResponseFixtures.get_sheet_failure("get_sheet_fail_id")
  end

  def get("/sheets/" <> id, _headers, _options) do
    Smartsheet.MockClient.ResponseFixtures.get_sheet_success(id)
  end

  def post("/sheets", _attributes, _headers) do
    Smartsheet.MockClient.ResponseFixtures.create_sheet_success()
  end

  def post("/sheets/:id/rows", rows, _headers) do
    Smartsheet.MockClient.ResponseFixtures.add_rows_success(rows)
  end

  def post("/sheets/" <> suffix, attributes, headers) do
    case String.split(suffix, "/") do
      ["add_rows_fail_id", "rows"] ->
        Smartsheet.MockClient.ResponseFixtures.add_rows_failure()

      [_id, "rows"] ->
        Smartsheet.MockClient.post("/sheets/:id/rows", attributes, headers)

      _ ->
        nil
    end
  end
end
