defmodule IdeaHub.Repo do
  use Ecto.Repo,
    otp_app: :idea_hub,
    adapter: Ecto.Adapters.Postgres
end
