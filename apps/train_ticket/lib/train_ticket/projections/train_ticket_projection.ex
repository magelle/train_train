defmodule TrainTicket.TrainTicketProjection do
  use Ecto.Schema
  @primary_key {:uuid, :string, []}

  schema "train_ticket_projections" do
    field(:name, :string)
  end
end
