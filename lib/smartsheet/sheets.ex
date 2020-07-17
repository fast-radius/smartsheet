defmodule Smartsheet.Sheets do
  def get(sheet_id, options \\ []) do
    {:ok, response = %HTTPoison.Response{}} =
      Smartsheet.client().get("/sheets/#{sheet_id}", [], params: options)

    Smartsheet.ParseResponse.parse(__MODULE__, __ENV__.function, response)
  end

  def create(attributes = %{name: _, columns: _}) do
    {:ok, response = %HTTPoison.Response{}} =
      Smartsheet.client().post("/sheets", attributes, "Content-Type": "application/json")

    Smartsheet.ParseResponse.parse(__MODULE__, __ENV__.function, response)
  end
end
