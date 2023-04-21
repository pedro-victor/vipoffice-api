defmodule VipOffice.Repo do
  use Ecto.Repo,
    otp_app: :vip_office,
    adapter: Ecto.Adapters.Postgres
end
