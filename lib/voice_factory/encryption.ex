defmodule VoiceFactory.Encryption do
  alias Comeonin.Argon2

  @spec hash_password(String.t()) :: String.t()
  defdelegate hash_password(password), to: Argon2, as: :hashpwsalt

  @spec validate_password(String.t(), String.t()) :: boolean
  defdelegate validate_password(password, hash), to: Argon2, as: :checkpw

  def generate_random_key(length) do
    length
    |> :crypto.strong_rand_bytes()
    |> Base.url_encode64()
    |> binary_part(0, length)
  end
end
