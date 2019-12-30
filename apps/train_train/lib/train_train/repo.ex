defmodule TrainTrain.Repo do
  use Ecto.Repo,
    otp_app: :train_train,
    adapter: Ecto.Adapters.Postgres
end
