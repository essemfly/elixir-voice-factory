defmodule VoiceFactoryWeb.MainController do
  use VoiceFactoryWeb, :controller

  alias VoiceFactory.Celeb
  alias VoiceFactory.Source
  alias VoiceFactory.Subtitle
  alias VoiceFactory.Repo

  def index(conn, _params) do
    conn
    |> render("index.html")
  end

  def add_celeb(conn, %{"celeb_name" => celeb_name}) do
    celeb = Celeb.create(%{name: celeb_name})
    json(conn, celeb)
  end

  def add_source(conn, %{
        "celeb_id" => celeb_id,
        "topic" => topic,
        "video_url" => video_url,
        "full_text" => full_text
      }) do
    source =
      Source.create(%{
        celeb_id: celeb_id,
        topic: topic,
        video_url: video_url,
        full_text: full_text
      })

    json(conn, source)
  end

  def add_subtitle(conn, %{
        "source_id" => source_id,
        "from_time" => from_time,
        "to_time" => to_time,
        "text" => text
      }) do
    subtitle =
      Subtitle.create(%{
        source_id: source_id,
        from_time: from_time,
        to_time: to_time,
        text: text,
        length: to_time - from_time
      })

    json(conn, subtitle)
  end

  def add_subtitle(conn, %{"source_id" => source_id, "text" => text}) do
    subtitle = Subtitle.create(%{source_id: source_id, text: text})
    json(conn, subtitle)
  end

  def list_celebs(conn, _params) do
    json(conn, Repo.all(VoiceFactory.Celeb))
  end

  def list_sources(conn, _params) do
    json(conn, Repo.all(VoiceFactory.Source))
  end
end
