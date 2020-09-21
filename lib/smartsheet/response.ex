defmodule Smartsheet.Response do
  defstruct [
    :request,
    :body,
    :headers,
    :status_code
  ]

  @type t :: %__MODULE__{
          status_code: any,
          body: any,
          headers: any,
          request: Smartsheet.Request.t()
        }

  def format(%HTTPoison.Response{} = response) do
    %Smartsheet.Response{
      request: Smartsheet.Request.format(response.request),
      body: response.body,
      headers: response.headers,
      status_code: response.status_code
    }
  end
end
