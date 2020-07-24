defmodule Smartsheet.Row do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :sheet_id,
    :access_level,
    :attachments,
    :cells,
    :columns,
    :conditional_format,
    :created_at,
    :created_by,
    :discussions,
    :expanded,
    :filtered_out,
    :format,
    :in_critical_path,
    :locked,
    :locked_for_user,
    :modified_at,
    :modified_by,
    :permalink,
    :row_number,
    :version
  ]
end
