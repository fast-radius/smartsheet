defmodule Smartsheet.Column do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :system_column_type,
    :type,
    :auto_number_format,
    :contact_options,
    :description,
    :format,
    :hidden,
    :index,
    :locked,
    :locked_for_user,
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
