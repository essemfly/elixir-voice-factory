defmodule VoiceFactoryWeb.Router do
  use VoiceFactoryWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :auth do
    plug(VoiceFactory.Auth.Pipeline)
  end

  pipeline :ensure_auth do
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", VoiceFactoryWeb do
    # Use the default browser stack
    pipe_through([:browser, :auth])

    get("/", LoginController, :index)
    post("/", LoginController, :login)
    post("/logout", LoginController, :logout)
  end

  scope "/", VoiceFactoryWeb do
    pipe_through([:browser, :auth, :ensure_auth])

    get("/secret", LoginController, :secret)
  end

  scope "/main", VoiceFactoryWeb do
    # pipe_through([:browser, :auth, :ensure_auth])
    # pipe_through([:browser])

    get("/", MainController, :index)
    post("/celeb", MainController, :add_celeb)
    post("/source", MainController, :add_source)
    post("/subtitle", MainController, :add_subtitle)
  end
end
