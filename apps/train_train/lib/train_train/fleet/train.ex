defmodule TrainTrain.Fleet.Train do
  use Ecto.Schema
  import Ecto.Changeset
  @moduledoc """
    Train schemas
  """

  schema "trains" do
    field :name, :string
    field :number_of_seats, :integer

    timestamps()
  end

  @doc false
  def changeset(train, attrs) do
    train
    |> cast(attrs, [:name, :number_of_seats])
    |> validate_required([:name, :number_of_seats])
  end
end
