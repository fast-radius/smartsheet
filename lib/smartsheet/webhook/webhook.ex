defmodule Smartsheet.Webhook do
  @derive [Poison.Encoder]

  defstruct [
    :apiClientId,
    :id,
    :apiClientName,
    :createdAt,
    :disabledDetails,
    :enabled,
    :modifiedAt,
    :sharedSecret,
    :stats,
    :status,
    :callbackUrl,
    :events,
    :name,
    :scope,
    :scopeObjectId,
    :subscope,
    :version
  ]

  @type t :: %__MODULE__{
          apiClientId: any,
          id: any,
          apiClientName: any,
          createdAt: any,
          disabledDetails: any,
          enabled: any,
          modifiedAt: any,
          sharedSecret: any,
          stats: any,
          status: any,
          callbackUrl: any,
          events: any,
          name: any,
          scope: any,
          scopeObjectId: any,
          subscope: any,
          version: any
        }
end
