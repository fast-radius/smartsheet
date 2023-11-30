defmodule Smartsheet.Cell do
  @derive [Jason.Encoder]

  defstruct [
    :column_id,
    :column_type,
    :conditional_format,
    :display_value,
    :format,
    :formula,
    :hyperlink,
    :image,
    :link_in_from_cell,
    :links_out_to_cells,
    :object_value,
    :override_validation,
    :strict,
    :value
  ]
end
