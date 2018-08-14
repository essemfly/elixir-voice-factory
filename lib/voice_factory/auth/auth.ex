defmodule VoiceFactory.Auth do

  import Plug.Conn
  alias VoiceFactory.Auth.Guardian

  def login(conn, user) do
    conn
    |> Guardian.Plug.sign_in(user)
    |> assign(:current_user, user)
  end

  def logout(conn) do
    conn
    |> Guardian.Plug.sign_out()
  end
end