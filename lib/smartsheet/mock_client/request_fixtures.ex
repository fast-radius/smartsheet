defmodule Smartsheet.MockClient.RequestFixtures do
  def create_sheet_success() do
    columns = [
      %{
        primary: true,
        title: "Column_1",
        type: Smartsheet.Column.ColumnType.text_number()
      }
    ]

    %{name: "Create Sheet Success", columns: columns}
  end

  def create_sheet_failure() do
    columns = [
      %{
        primary: false,
        title: "Column_1",
        type: Smartsheet.Column.ColumnType.text_number()
      }
    ]

    %{name: "Create Sheet Failure", columns: columns}
  end
end
