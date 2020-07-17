defmodule Smartsheet.Row do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :sheetId,
    :accessLevel,
    :attachments,
    :cells,
    :columns,
    :conditionalFormat,
    :createdAt,
    :createdBy,
    :discussions,
    :expanded,
    :filteredOut,
    :format,
    :inCriticalPath,
    :locked,
    :lockedForUser,
    :modifiedAt,
    :modifiedBy,
    :permalink,
    :rowNumber,
    :version
  ]
end
