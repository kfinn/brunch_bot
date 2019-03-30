# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :brunch_bot,
  ecto_repos: [BrunchBot.Repo]

# Configures the endpoint
config :brunch_bot, BrunchBotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FI+o17fXjgKUf2rnyi6t6PG/M6QAjz8oBerl01CUg3vSVSc+8pH2SPeAqb0+FfkO",
  render_errors: [view: BrunchBotWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: BrunchBot.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
