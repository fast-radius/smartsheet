defmodule Smartsheet.ParseResponse do
  @moduledoc """
  Parses a raw HTTPoision.Response into the relevant data structures for the caller,
  and returns a wrapped Smartsheet.Response in a consistent way:

  success: {:ok, %Smartsheet.Response{}, data}
  failure: {:error, %Smartsheet.Response{}}
  """

  def parse(Smartsheet.Sheets, {:get, _arity}, response = %HTTPoison.Response{}) do
    case response.status_code do
      200 ->
        sheet = parse_sheet(response.body)
        success_response(response, sheet)

      _ ->
        error_response(response)
    end
  end

  def parse(Smartsheet.Sheets, {:create, _arity}, response = %HTTPoison.Response{}) do
    case response.status_code do
      200 ->
        sheet = parse_sheet(response.body.result)
        success_response(response, sheet)

      _ ->
        error_response(response)
    end
  end

  def parse(Smartsheet.Rows, {:add_to_sheet, _arity}, response = %HTTPoison.Response{}) do
    case response.status_code do
      200 ->
        rows = parse_rows(response.body.result)
        success_response(response, rows)

      _ ->
        error_response(response)
    end
  end

  defp parse_rows(row_maps) do
    Enum.map(row_maps, fn row_map ->
      parse_row(row_map)
    end)
  end

  defp parse_row(row_map) do
    cond do
      Map.has_key?(row_map, :cells) ->
        cells = parse_cells(row_map.cells)
        row = %{row_map | cells: cells}
        struct(Smartsheet.Row, row)

      true ->
        struct(Smartsheet.Row, row_map)
    end
  end

  defp parse_cells(cell_maps) do
    Enum.map(cell_maps, fn cell_map -> struct(Smartsheet.Cell, cell_map) end)
  end

  defp parse_sheet(sheet_map) do
    cond do
      Map.has_key?(sheet_map, :columns) ->
        columns = parse_columns(sheet_map.columns)
        sheet = %{sheet_map | columns: columns}
        struct(Smartsheet.Sheet, sheet)

      true ->
        struct(Smartsheet.Sheet, sheet_map)
    end
  end

  defp parse_columns(columns) do
    Enum.map(columns, fn column -> struct(Smartsheet.Column, column) end)
  end

  def success_response(response = %HTTPoison.Response{}, data) do
    formatted_response = Smartsheet.Response.format(response)
    {:ok, formatted_response, data}
  end

  def error_response(response = %HTTPoison.Response{}) do
    formatted_response = Smartsheet.Response.format(response)
    {:error, formatted_response}
  end
end
