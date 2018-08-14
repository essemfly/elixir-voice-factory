defmodule VoiceFactoryWeb.PageController do
  use VoiceFactoryWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
