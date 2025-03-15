defmodule TodoistClone.Repo do
  use Ecto.Repo,
    otp_app: :todoist_clone,
    adapter: Ecto.Adapters.Postgres
end
