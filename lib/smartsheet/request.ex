defmodule Smartsheet.Request do
  defstruct [
    :body,
    :headers,
    :method,
    :options,
    :params,
    :url
  ]

  def format(%HTTPoison.Request{} = request) do
    %Smartsheet.Request{
      body: request.body,
      headers: request.headers,
      method: request.method,
      options: request.options,
      params: request.params,
      url: request.url
    }
  end
end
