defmodule Chakra.Repo do
  use Ecto.Repo,
    otp_app: :chakra,
    adapter: Ecto.Adapters.Postgres
end
