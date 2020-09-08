defmodule Smartsheet.Rows do
  def add_to_sheet(sheet_id, row = %{}) do
    Smartsheet.Rows.add_to_sheet(sheet_id, [row])
  end

  def add_to_sheet(sheet_id, rows) do
    path = "/sheets/#{sheet_id}/rows"

    {:ok, response = %HTTPoison.Response{}} =
      Smartsheet.client().post(path, rows, "Content-Type": "application/json")

    Smartsheet.ParseResponse.parse(__MODULE__, __ENV__.function, response)
  end

  def update(sheet_id, row = %{}) do
    Smartsheet.Rows.update(sheet_id, [row])
  end

  def update(sheet_id, rows) do
    path = "/sheets/#{sheet_id}/rows"

    {:ok, response = %HTTPoison.Response{}} =
      Smartsheet.client().put(path, rows, "Content-Type": "application/json")

    Smartsheet.ParseResponse.parse(__MODULE__, __ENV__.function, response)
  end
end
