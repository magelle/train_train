defmodule TrainTicket.Repo do
  use Ecto.Repo,
      otp_app: :train_ticket,
      adapter: Ecto.Adapters.Postgres
end
