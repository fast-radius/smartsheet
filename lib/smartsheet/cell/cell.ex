defmodule Smartsheet.Cell do
  @derive [Poison.Encoder]

  defstruct [
    :columnId,
    :columnType,
    :conditionalFormat,
    :displayValue,
    :format,
    :formula,
    :hyperlink,
    :image,
    :linkInFromCell,
    :linksOutToCells,
    :objectValue,
    :overrideValidation,
    :strict,
    :value
  ]
end
