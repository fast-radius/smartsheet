defmodule Smartsheet.Column do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :systemColumnType,
    :type,
    :autoNumberFormat,
    :contactOptions,
    :description,
    :format,
    :hidden,
    :index,
    :locked,
    :lockedForUser,
    :options,
    :primary,
    :symbol,
    :tags,
    :title,
    :validation,
    :version,
    :width
  ]
end
