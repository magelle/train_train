defmodule TrainTrain.Repo.Migrations.CreateTrains do
  use Ecto.Migration

  def change do
    create table(:trains) do
      add :name, :string
      add :number_of_seats, :integer

      timestamps()
    end
  end
end
