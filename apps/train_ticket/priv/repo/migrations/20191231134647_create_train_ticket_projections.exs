defmodule TrainTicket.Repo.Migrations.CreateTrainTicketProjections do
  use Ecto.Migration

  def change do
    create table(:train_ticket_projections, primary_key: false) do
      add(:uuid, :text, primary_key: true)
      add(:name, :text)
    end
  end
end
