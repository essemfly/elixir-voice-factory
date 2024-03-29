# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :voice_factory, ecto_repos: [VoiceFactory.Repo]

# Configures the endpoint
config :voice_factory, VoiceFactoryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "X1mvrnwCmk333xG57I4oHFn9945hFFCe7LzkURemHxxGOaR4mVczICRmV5mFB0nd",
  render_errors: [view: VoiceFactoryWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: VoiceFactory.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configures Guardian
config :voice_factory, VoiceFactory.Auth.Guardian,
  issuer: "voice_factory",
  secret_key: "Hya/2Aff/xWYq9X2BQYv5rNJf7bKusc2UX9G1DcIdT46fjiWDklFtE1KwRsrrxaq"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
