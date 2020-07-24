defmodule Smartsheet.Sheet do
  @derive [Poison.Encoder]

  defstruct [
    :id,
    :from_id,
    :owner_id,
    :access_level,
    :attachments,
    :columns,
    :created_at,
    :cross_sheet_references,
    :dependencies_enabled,
    :discussions,
    :effective_attachment_options,
    :favorite,
    :gantt_enabled,
    :has_summary_fields,
    :modified_at,
    :name,
    :owner,
    :permalink,
    :project_settings,
    :read_only,
    :resource_management_enabled,
    :rows,
    :show_parent_rows_for_filters,
    :source,
    :summary,
    :total_row_count,
    :user_permissions,
    :user_settings,
    :version,
    :workspace
  ]
end
