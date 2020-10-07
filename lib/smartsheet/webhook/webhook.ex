defmodule Smartsheet.Webhook do
  @derive [Poison.Encoder]

  defstruct [
    :api_client_id,
    :id,
    :api_client_name,
    :created_at,
    :disabled_details,
    :enabled,
    :modified_at,
    :shared_secret,
    :stats,
    :status,
    :callback_url,
    :events,
    :name,
    :scope,
    :scope_object_id,
    :subscope,
    :version
  ]

  @type t :: %__MODULE__{
          api_client_id: any,
          id: any,
          api_client_name: any,
          created_at: any,
          disabled_details: any,
          enabled: any,
          modified_at: any,
          shared_secret: any,
          stats: any,
          status: any,
          callback_url: any,
          events: any,
          name: any,
          scope: any,
          scope_object_id: any,
          subscope: any,
          version: any
        }
end
