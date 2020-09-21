defmodule Smartsheet.ClientBehaviour do
  @callback get_sheet(String.t(), List) ::
              {:ok, Smartsheet.Response.t(), Smartsheet.Sheet.t()}
              | {:error, Smartsheet.Response.t()}

  @callback create_sheet(map()) ::
              {:ok, Smartsheet.Response.t(), Smartsheet.Sheet.t()}
              | {:error, Smartsheet.Response.t()}

  @callback add_rows(String.t(), any) ::
              {:ok, Smartsheet.Response.t(), [Smartsheet.Row.t()]}
              | {:error, Smartsheet.Response.t()}

  @callback update_rows(String.t(), any) ::
              {:ok, Smartsheet.Response.t(), [Smartsheet.Row.t()]}
              | {:error, Smartsheet.Response.t()}
end
