defmodule TrainTicket.Events.Created do
  @moduledoc """
    When a new ticket is created
  """

  @derive Jason.Encoder
  defstruct [:uuid, :name]
end
