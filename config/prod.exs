import Config

# APP_NAME will be exposed at build time by Gigalixir
# no need to set this yourself.
# DATABASE_URL is set when creating the DB through the
# Gigalixir CLI.
# Use 'mix phx.gen.secret' to create a SECRET_KEY_BASE
# and set using 'gigalixir config:set SECRET_KEY_BASE=value

config :chakra, Chakra.Repo,
  adapter: Ecto.Adapters.Postgres,
  # Set by Gigalixir.
  database: "",
  # Was easier to just set this value here.
  # The Free Tier will only allow up to 2 connections
  # anyways so no big deal.
  pool_size: 2,
  ssl: true,
  url: System.get_env("DATABASE_URL")

config :chakra, ChakraWeb.Endpoint,
  http: [port: 4000],
  load_from_system_env: true,
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  server: true,
  url: [host: "#{System.get_env("APP_NAME")}.gigalixirapp.com", port: 443]

config :logger, level: :info
