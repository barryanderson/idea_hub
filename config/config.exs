# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :idea_hub,
  ecto_repos: [IdeaHub.Repo]

# Configures the endpoint
config :idea_hub, IdeaHubWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YlmXMmF0PU44r3/oFopS8zhPl1yHG8/7a3nBDHECcdoC55US2BE+g9E71yJm8nU3",
  render_errors: [view: IdeaHubWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: IdeaHub.PubSub,
  live_view: [signing_salt: "BowMR1Vv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
