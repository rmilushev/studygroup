# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

config :studygroup,
  ecto_repos: [Studygroup.Repo]

# Configures the endpoint
config :studygroup, StudygroupWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/BfrdFC1qJEogg/b8IC3zy/qUdGn3PWP1HcdTILL+oqCx21iRWtNjk/i1Q09V+sw",
  render_errors: [view: StudygroupWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Studygroup.PubSub,
  live_view: [signing_salt: "2sM27n5o"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
