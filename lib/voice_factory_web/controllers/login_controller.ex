defmodule VoiceFactoryWeb.LoginController do
  use VoiceFactoryWeb, :controller

  alias VoiceFactory.Admin

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, %{"session" => %{"email" => email, "password" => password}}) do
    with %Admin{} = admin <- VoiceFactory.Admin.get_by_authentication(email, password) do
      conn
      |> VoiceFactory.Auth.login(admin)
      |> put_flash(:info, "Welcome back!")
      |> redirect(to: page_path(conn, :index))
    else
      _ ->  
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
    end
  end
end