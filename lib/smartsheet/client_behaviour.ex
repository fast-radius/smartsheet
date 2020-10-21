defmodule Smartsheet.ClientBehaviour do
  @callback add_webhook(map()) ::
              {:ok, Smartsheet.Response.t(), Smartsheet.Webhook.t()}
              | {:error, Smartsheet.Response.t()}
              | {:internal_error, atom()}

  @callback list_webhooks() ::
              {:ok, Smartsheet.Response.t(), [Smartsheet.Webhook.t()]}
              | {:error, Smartsheet.Response.t()}
              | {:internal_error, atom()}

  @callback update_webhook(String.t(), map()) ::
              {:ok, Smartsheet.Respone.t(), Smartsheet.Webhook.t()}
              | {:error, Smartsheet.Response.t()}
              | {:internal_error, atom()}

  @callback delete_webhook(String.t()) ::
              {:ok, Smartsheet.Respone.t(), map()}
              | {:error, Smartsheet.Response.t()}
              | {:internal_error, atom()}

  @callback create_sheet(map()) ::
              {:ok, Smartsheet.Response.t(), Smartsheet.Sheet.t()}
              | {:error, Smartsheet.Response.t()}
              | {:internal_error, atom()}

  @callback get_sheet(String.t(), List) ::
              {:ok, Smartsheet.Response.t(), Smartsheet.Sheet.t()}
              | {:error, Smartsheet.Response.t()}

  @callback get_columns(String.t(), List) ::
              {:ok, Smartsheet.Response.t(), [Smartsheet.Column]}
              | {:error, Smartsheet.Response.t()}
              | {:internal_error, atom()}

  @callback add_rows(String.t(), any) ::
              {:ok, Smartsheet.Response.t(), [Smartsheet.Row.t()]}
              | {:error, Smartsheet.Response.t()}
              | {:internal_error, atom()}

  @callback get_row(String.t(), String.t()) ::
              {:ok, Smartsheet.Response.t(), Smartsheet.Row.t()}
              | {:error, Smartsheet.Response.t()}
              | {:internal_error, atom()}

  @callback update_rows(String.t(), any) ::
              {:ok, Smartsheet.Response.t(), [Smartsheet.Row.t()]}
              | {:error, Smartsheet.Response.t()}
              | {:internal_error, atom()}

  @callback delete_rows(String.t(), List) ::
              {:ok, Smartsheet.Response.t(), map()}
              | {:error, Smartsheet.Response.t()}
              | {:internal_error, atom()}
end
