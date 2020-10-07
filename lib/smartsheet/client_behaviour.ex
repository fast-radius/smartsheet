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

  @callback add_webhook(map()) ::
              {:ok, Smartsheet.Response.t(), Smartsheet.Webhook.t()}
              | {:error, Smartsheet.Response.t()}

  @callback update_webhook(String.t(), map()) ::
              {:ok, Smartsheet.Respone.t(), Smartsheet.Webhook.t()}
              | {:error, Smartsheet.Response.t()}

  @callback delete_webhook(String.t()) ::
              {:ok, Smartsheet.Respone.t(), map()} | {:error, Smartsheet.Response.t()}

  @callback list_webhooks() ::
              {:ok, Smartsheet.Response.t(), [Smartsheet.Webhook.t()]}
              | {:error, Smartsheet.Response.t()}
end
