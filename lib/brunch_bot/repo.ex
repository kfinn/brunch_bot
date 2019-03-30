defmodule BrunchBot.Repo do
  use Ecto.Repo,
    otp_app: :brunch_bot,
    adapter: Ecto.Adapters.Postgres
end
