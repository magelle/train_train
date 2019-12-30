use Mix.Config

# Configure your database
config :train_train, TrainTrain.Repo,
  username: "train_train_user",
  password: "train_train_password",
  database: "train_train_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :train_train_web, TrainTrainWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
