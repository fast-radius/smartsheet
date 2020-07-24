defmodule Smartsheet.MockClient.ResponseFixtures do
  def get_sheet_success(id \\ 1) do
    format_response(%HTTPoison.Response{
      body: %{
        access_level: "OWNER",
        cell_image_upload_enabled: true,
        columns: [
          %{
            id: 1,
            primary: true,
            title: "Names",
            type: "TEXT_NUMBER"
          },
          %{
            id: 2,
            title: "Numbers",
            type: "TEXT_NUMBER"
          }
        ],
        created_at: "2020-07-22T15:39:42Z",
        dependencies_enabled: false,
        effective_attachment_options: [
          "BOX_COM",
          "LINK",
          "EGNYTE",
          "ONEDRIVE",
          "DROPBOX",
          "GOOGLE_DRIVE",
          "EVERNOTE",
          "FILE"
        ],
        gantt_enabled: false,
        id: id,
        is_multi_picklist_enabled: true,
        modified_at: "2020-07-22T20:29:52Z",
        name: "Test Sheet",
        permalink: "https://app.smartsheet.com/sheets/123",
        resource_management_enabled: false,
        rows: [
          %{
            cells: [
              %{column_id: 1, display_value: "Joe", value: "Joe"},
              %{column_id: 2, display_value: "21", value: 21.0}
            ],
            created_at: "2020-07-22T15:56:32Z",
            expanded: true,
            id: 1,
            modified_at: "2020-07-22T15:56:32Z",
            row_number: 1
          },
          %{
            cells: [
              %{column_id: 1, display_value: "Kent", value: "Kent"},
              %{column_id: 2, display_value: "20", value: 20.0}
            ],
            created_at: "2020-07-22T15:54:16Z",
            expanded: true,
            id: 2,
            modified_at: "2020-07-22T15:56:32Z",
            row_number: 2,
            sibling_id: 1
          }
        ],
        total_row_count: 6,
        user_settings: %{critical_path_enabled: false, display_summary_tasks: true},
        version: 9
      },
      headers: [
        {"Date", "Wed, 22 Jul 2020 21:05:23 GMT"},
        {"Content-Type", "application/json;charset=UTF-8"},
        {"Content-Length", "2544"},
        {"Connection", "close"},
        {"Cache-Control", "no-cache, no-store, must-revalidate"},
        {"Pragma", "no-cache"},
        {"Expires", "0"},
        {"Vary", "Accept-Encoding"}
      ],
      request: %HTTPoison.Request{
        body: "\"\"",
        headers: [Authorization: "Bearer 123"],
        method: :get,
        options: [params: []],
        params: [],
        url: "https://api.smartsheet.com/2.0/sheets/5669708297987972"
      },
      request_url: "https://api.smartsheet.com/2.0/sheets/5669708297987972",
      status_code: 200
    })
  end

  def get_sheet_failure(id \\ 1) do
    format_response(%HTTPoison.Response{
      body: %{error_code: 1006, message: "Not Found", ref_id: "3egxrzoa85fz"},
      headers: [
        {"Date", "Wed, 22 Jul 2020 21:10:38 GMT"},
        {"Content-Type", "application/json;charset=UTF-8"},
        {"Content-Length", "79"},
        {"Connection", "close"},
        {"Vary", "Accept-Encoding"}
      ],
      request: %HTTPoison.Request{
        body: "\"\"",
        headers: [Authorization: "Bearer 123"],
        method: :get,
        options: [params: []],
        params: [],
        url: "https://api.smartsheet.com/2.0/sheets/#{id}"
      },
      request_url: "https://api.smartsheet.com/2.0/sheets/#{id}",
      status_code: 404
    })
  end

  def create_sheet_success() do
    format_response(%HTTPoison.Response{
      body: %{
        message: "SUCCESS",
        result: %{
          access_level: "OWNER",
          columns: [
            %{
              id: 1,
              index: 0,
              primary: true,
              title: "Names",
              type: "TEXT_NUMBER",
              validation: false,
              version: 0,
              width: 150
            }
          ],
          id: 1,
          name: "Test",
          permalink: "https://app.smartsheet.com/sheets/123"
        },
        result_code: 0
      },
      headers: [
        {"Date", "Wed, 22 Jul 2020 21:12:47 GMT"},
        {"Content-Type", "application/json;charset=UTF-8"},
        {"Content-Length", "334"},
        {"Connection", "keep-alive"},
        {"Cache-Control", "no-cache, no-store, must-revalidate"},
        {"Pragma", "no-cache"},
        {"Expires", "0"},
        {"Vary", "Accept-Encoding"}
      ],
      request: %HTTPoison.Request{
        body:
          "{\"name\":\"Test\",\"columns\":[{\"type\":\"TEXT_NUMBER\",\"title\":\"Names\",\"primary\":true}]}",
        headers: [
          Authorization: "Bearer 123",
          "Content-Type": "application/json"
        ],
        method: :post,
        options: [],
        params: %{},
        url: "https://api.smartsheet.com/2.0/sheets"
      },
      request_url: "https://api.smartsheet.com/2.0/sheets",
      status_code: 200
    })
  end

  def create_sheet_failure() do
    format_response(%HTTPoison.Response{
      body: %{
        error_code: 1012,
        message: "Required object attribute(s) are missing from your request: column.type.",
        ref_id: "1n9hbseo35sl4"
      },
      headers: [
        {"Date", "Wed, 22 Jul 2020 21:15:31 GMT"},
        {"Content-Type", "application/json;charset=UTF-8"},
        {"Content-Length", "143"},
        {"Connection", "keep-alive"},
        {"Vary", "Accept-Encoding"}
      ],
      request: %HTTPoison.Request{
        body: "{\"name\":\"Test\",\"columns\":[{\"title\":\"Names\",\"primary\":true}]}",
        headers: [
          Authorization: "Bearer 123",
          "Content-Type": "application/json"
        ],
        method: :post,
        options: [],
        params: %{},
        url: "https://api.smartsheet.com/2.0/sheets"
      },
      request_url: "https://api.smartsheet.com/2.0/sheets",
      status_code: 400
    })
  end

  def add_rows_success() do
    format_response(%HTTPoison.Response{
      body: %{
        message: "SUCCESS",
        result: [
          %{
            cells: [%{column_id: 7_136_425_824_020_356}, %{column_id: 1_506_926_289_807_236}],
            created_at: "2020-07-22T21:26:48Z",
            expanded: true,
            id: 2_912_283_551_393_668,
            locked: true,
            locked_for_user: false,
            modified_at: "2020-07-22T21:26:48Z",
            row_number: 7,
            sheet_id: 5_669_708_297_987_972,
            sibling_id: 6_033_822_295_582_596
          },
          %{
            cells: [%{column_id: 7_136_425_824_020_356}, %{column_id: 1_506_926_289_807_236}],
            created_at: "2020-07-22T21:26:48Z",
            expanded: true,
            id: 7_415_883_178_764_164,
            locked: true,
            locked_for_user: false,
            modified_at: "2020-07-22T21:26:48Z",
            row_number: 8,
            sheet_id: 5_669_708_297_987_972,
            sibling_id: 2_912_283_551_393_668
          }
        ],
        result_code: 0,
        version: 10
      },
      headers: [
        {"Date", "Wed, 22 Jul 2020 21:26:48 GMT"},
        {"Content-Type", "application/json;charset=UTF-8"},
        {"Transfer-Encoding", "chunked"},
        {"Connection", "keep-alive"},
        {"Cache-Control", "no-cache, no-store, must-revalidate"},
        {"Pragma", "no-cache"},
        {"Expires", "0"},
        {"Vary", "Accept-Encoding"}
      ],
      request: %HTTPoison.Request{
        body: "[{\"locked\":true},{\"toBottom\":true,\"locked\":true}]",
        headers: [
          Authorization: "Bearer 123",
          "Content-Type": "application/json"
        ],
        method: :post,
        options: [],
        params: %{},
        url: "https://api.smartsheet.com/2.0/sheets/123/rows"
      },
      request_url: "https://api.smartsheet.com/2.0/sheets/123/rows",
      status_code: 200
    })
  end

  def add_rows_failure() do
    format_response(%HTTPoison.Response{
      body: %{
        detail: %{index: 1},
        error_code: 1062,
        message: "Invalid row location: You must use at least 1 location specifier.",
        ref_id: "16gagztqa3sxq"
      },
      headers: [
        {"Date", "Wed, 22 Jul 2020 21:24:55 GMT"},
        {"Content-Type", "application/json;charset=UTF-8"},
        {"Content-Length", "172"},
        {"Connection", "keep-alive"},
        {"Vary", "Accept-Encoding"}
      ],
      request: %HTTPoison.Request{
        body: "[{\"locked\":true},{\"locked\":true}]",
        headers: [
          Authorization: "Bearer 123",
          "Content-Type": "application/json"
        ],
        method: :post,
        options: [],
        params: %{},
        url: "https://api.smartsheet.com/2.0/sheets/5669708297987972/rows"
      },
      request_url: "https://api.smartsheet.com/2.0/sheets/5669708297987972/rows",
      status_code: 400
    })
  end

  defp format_response(response = %HTTPoison.Response{}) do
    {:ok, response}
  end
end
