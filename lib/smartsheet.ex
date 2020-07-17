defmodule Smartsheet do
  @moduledoc """
    An elixir library to interact with the Smartsheet API.
  """
  def client() do
    Application.get_env(:smartsheet, :client)
  end
end
