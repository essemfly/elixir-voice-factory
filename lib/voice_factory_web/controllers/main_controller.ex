defmodule VoiceFactoryWeb.MainController do
  use VoiceFactoryWeb, :controller

  def index(conn, _params) do
    conn
    |> render(
      "index.html"
    )
  end
end
