import Config

app_name = System.get_env("APP_NAME")
database_url = System.get_env("DATABASE_URL")
pool_size = System.get_env("POOL_SIZE")
port = System.get_env("PORT")
secret_key_base = System.get_env("SECRET_KEY_BASE")

config :chakra, Chakra.Repo,
  adapter: Ecto.Adapters.Postgres,
  # Set by Gigalixir
  database: "",
  pool_size: String.to_integer(port || "10"),
  ssl: true,
  url: database_url

config :chakra, ChakraWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  load_from_system_env: true,
  secret_key_base: secret_key_base,
  server: true,
  url: [host: "${APP_NAME}.gigalixirapp.com", port: 443]

config :logger, level: :info
