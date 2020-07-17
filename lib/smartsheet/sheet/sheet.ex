defmodule Smartsheet.Sheet do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :fromId,
    :ownerId,
    :accessLevel,
    :attachments,
    :columns,
    :createdAt,
    :crossSheetReferences,
    :dependenciesEnabled,
    :discussions,
    :effectiveAttachmentOptions,
    :favorite,
    :ganttEnabled,
    :hasSummaryFields,
    :modifiedAt,
    :name,
    :owner,
    :permalink,
    :projectSettings,
    :readOnly,
    :resourceManagementEnabled,
    :rows,
    :showParentRowsForFilters,
    :source,
    :summary,
    :totalRowCount,
    :userPermissions,
    :userSettings,
    :version,
    :workspace
  ]
end
