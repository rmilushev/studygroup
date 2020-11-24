defmodule Studygroup.Repo do
  use Ecto.Repo,
    otp_app: :studygroup,
    adapter: Ecto.Adapters.Postgres
end
