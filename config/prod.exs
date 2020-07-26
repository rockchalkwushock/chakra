import Config

config :chakra, Chakra.Repo,
  adapter: Ecto.Adapters.Postgres,
  # Set by Gigalixir
  database: "",
  pool_size: 2,
  ssl: true,
  url: System.get_env("DATABASE_URL")

config :chakra, ChakraWeb.Endpoint,
  http: [port: 4000],
  load_from_system_env: true,
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  server: true,
  url: [host: "#{app_name}.gigalixirapp.com", port: 443]

config :logger, level: :info
