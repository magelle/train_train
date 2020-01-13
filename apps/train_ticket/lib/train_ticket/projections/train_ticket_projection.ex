defmodule TrainTicket.TrainTicketProjection do
  @moduledoc """
    The train ticket main projection
  """

  use Ecto.Schema
  @primary_key {:uuid, :string, []}

  schema "train_ticket_projections" do
    field(:name, :string)
  end
end
