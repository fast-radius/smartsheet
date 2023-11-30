defmodule Smartsheet.Row do
  @derive [Jason.Encoder]

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

  @type t :: %__MODULE__{
          id: any,
          sheet_id: any,
          access_level: any,
          attachments: any,
          cells: any,
          columns: any,
          conditional_format: any,
          created_at: any,
          created_by: any,
          discussions: any,
          expanded: any,
          filtered_out: any,
          format: any,
          in_critical_path: any,
          locked: any,
          locked_for_user: any,
          modified_at: any,
          modified_by: any,
          permalink: any,
          row_number: any,
          version: any
        }
end
