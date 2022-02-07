# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :lords,
  ecto_repos: [Lords.Repo]

# Configures the endpoint
config :lords, LordsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UDI3Z5lLs5laUkBC05iIcGWwfVDjHQvgLhg3wMAdyZg+Ok8JbH9cNbVBu5RyjRp9",
  render_errors: [view: LordsWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Lords.PubSub,
  live_view: [signing_salt: "k7cFkCoe"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :lords, :pow,
  user: Lords.Users.User,
  repo: Lords.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
