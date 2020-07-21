use Mix.Config

config :smartsheet, api_key: System.get_env("SMARTSHEET_API_KEY")

import_config "#{Mix.env()}.exs"
