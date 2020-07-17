defmodule Smartsheet.MockClient.ResponseFixtures do
  def get_sheet_success(id \\ 1) do
    format_response(%HTTPoison.Response{
      body: %{
        accessLevel: "OWNER",
        cellImageUploadEnabled: true,
        columns: [
          %{
            id: 1,
            index: 0,
            primary: true,
            title: "Column_1",
            type: "TEXT_NUMBER",
            validation: false,
            version: 0,
            width: 150
          },
          %{
            id: 2,
            index: 1,
            title: "Column_2",
            type: "DATE",
            validation: false,
            version: 0,
            width: 150
          }
        ],
        createdAt: "2020-07-14T22:14:21Z",
        dependenciesEnabled: false,
        effectiveAttachmentOptions: [
          "DROPBOX",
          "EVERNOTE",
          "LINK",
          "BOX_COM",
          "FILE",
          "GOOGLE_DRIVE",
          "ONEDRIVE",
          "EGNYTE"
        ],
        ganttEnabled: false,
        id: id,
        isMultiPicklistEnabled: true,
        modifiedAt: "2020-07-14T22:14:21Z",
        name: "Test 1",
        permalink: "https://app.smartsheet.com/sheets/123",
        resourceManagementEnabled: false,
        rows: [],
        totalRowCount: 0,
        userSettings: %{criticalPathEnabled: false, displaySummaryTasks: true},
        version: 1
      },
      headers: [
        {"Date", "Wed, 15 Jul 2020 20:29:07 GMT"},
        {"Content-Type", "application/json;charset=UTF-8"},
        {"Content-Length", "841"},
        {"Connection", "keep-alive"},
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
        url: "https://api.smartsheet.com/2.0/sheets/#{id}"
      },
      request_url: "https://api.smartsheet.com/2.0/sheets/#{id}",
      status_code: 200
    })
  end

  def get_sheet_failure(id \\ 1) do
    format_response(%HTTPoison.Response{
      body: %{errorCode: 1006, message: "Not Found", refId: "85b4r1e7t7n6"},
      headers: [
        {"Date", "Thu, 16 Jul 2020 21:17:53 GMT"},
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
          accessLevel: "OWNER",
          columns: [
            %{
              id: 1,
              index: 0,
              primary: true,
              title: "Column_1",
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
        resultCode: 0
      },
      headers: [
        {"Date", "Wed, 15 Jul 2020 15:00:27 GMT"},
        {"Content-Type", "application/json;charset=UTF-8"},
        {"Content-Length", "338"},
        {"Connection", "keep-alive"},
        {"Cache-Control", "no-cache, no-store, must-revalidate"},
        {"Pragma", "no-cache"},
        {"Expires", "0"},
        {"Vary", "Accept-Encoding"}
      ],
      request: %HTTPoison.Request{
        body:
          "{\"name\":\"Test\",\"columns\":[{\"type\":\"TEXT_NUMBER\",\"title\":\"Column_1\",\"primary\":true}]}",
        headers: [
          "Content-Type": "application/json",
          Authorization: "Bearer 123"
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
        errorCode: 1055,
        message: "An error message",
        refId: "1qsax1o8bxwrd"
      },
      headers: [
        {"Date", "Wed, 15 Jul 2020 15:09:32 GMT"},
        {"Content-Type", "application/json;charset=UTF-8"},
        {"Content-Length", "111"},
        {"Connection", "keep-alive"},
        {"Vary", "Accept-Encoding"}
      ],
      request: %HTTPoison.Request{
        body:
          "{\"name\":\"Test\",\"columns\":[{\"type\":\"TEXT_NUMBER\",\"title\":\"Column_1\",\"primary\":false}]}",
        headers: [
          "Content-Type": "application/json",
          Authorization: "Bearer 123"
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
            cells: [
              %{columnId: 5_093_087_214_102_404, displayValue: "123456", value: 123_456.0},
              %{columnId: 2_841_287_400_417_156, value: "2020-07-14"}
            ],
            createdAt: "2020-07-15T21:40:41Z",
            expanded: true,
            id: 6_128_454_023_047_044,
            modifiedAt: "2020-07-15T21:40:41Z",
            rowNumber: 2,
            sheetId: 6_968_478_491_010_948,
            siblingId: 1_246_560_118_695_812
          }
        ],
        resultCode: 0,
        version: 3
      },
      headers: [
        {"Date", "Wed, 15 Jul 2020 21:40:41 GMT"},
        {"Content-Type", "application/json;charset=UTF-8"},
        {"Transfer-Encoding", "chunked"},
        {"Connection", "keep-alive"},
        {"Cache-Control", "no-cache, no-store, must-revalidate"},
        {"Pragma", "no-cache"},
        {"Expires", "0"},
        {"Vary", "Accept-Encoding"}
      ],
      request: %HTTPoison.Request{
        body:
          "[{\"cells\":[{\"value\":123456,\"columnId\":5093087214102404},{\"value\":\"2020-07-14\",\"columnId\":2841287400417156}]}]",
        headers: [
          "Content-Type": "application/json",
          Authorization: "Bearer 123"
        ],
        method: :post,
        options: [],
        params: %{},
        url: "https://api.smartsheet.com/2.0/sheets/6968478491010948/rows"
      },
      request_url: "https://api.smartsheet.com/2.0/sheets/6968478491010948/rows",
      status_code: 200
    })
  end

  def add_rows_failure() do
    format_response(%HTTPoison.Response{
      body: %{
        detail: %{index: 1},
        errorCode: 1062,
        message: "Invalid row location: You must use at least 1 location specifier.",
        refId: "accgrgzhw7ds"
      },
      headers: [
        {"Date", "Fri, 17 Jul 2020 16:55:03 GMT"},
        {"Content-Type", "application/json;charset=UTF-8"},
        {"Content-Length", "171"},
        {"Connection", "keep-alive"},
        {"Vary", "Accept-Encoding"}
      ],
      request: %HTTPoison.Request{
        body: "[{\"locked\":true},{\"locked\":true}]",
        headers: [
          "Content-Type": "application/json",
          Authorization: "Bearer 1234"
        ],
        method: :post,
        options: [],
        params: %{},
        url: "https://api.smartsheet.com/2.0/sheets/6802314796263300/rows"
      },
      request_url: "https://api.smartsheet.com/2.0/sheets/6802314796263300/rows",
      status_code: 400
    })
  end

  defp format_response(response = %HTTPoison.Response{}) do
    {:ok, response}
  end
end
