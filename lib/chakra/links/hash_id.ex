defmodule HashId do
  @moduledoc """
  Custom Ecto.Type for generating a unique
  hash_id for urls.
  """
  use Ecto.Type
  @spec type :: :string
  def type, do: :string

  # Desired length of hash_id.
  @hash_id_length 8

  @spec cast(any) :: :error | {:ok, binary}
  def cast(uri) when is_binary(uri) do
    {:ok, uri}
  end

  def cast(_), do: :error

  @spec dump(any) :: :error | {:ok, binary}
  def dump(uri) when is_binary(uri) do
    {:ok, uri}
  end

  def dump(_), do: :error

  @spec load(binary) :: {:ok, binary}
  def load(uri) when is_binary(uri) do
    {:ok, uri}
  end

  @doc """
  Callback invoked by autogenerate fields.
  """
  @spec autogenerate() :: String.t()
  def autogenerate, do: generate()

  @doc """
  Generates the unique hash_id.
  """
  @spec generate() :: String.t()
  def generate do
    @hash_id_length
    |> :crypto.strong_rand_bytes()
    |> Base.url_encode64()
    |> binary_part(0, @hash_id_length)
  end
end
