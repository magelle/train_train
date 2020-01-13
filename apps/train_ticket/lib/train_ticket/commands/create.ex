defmodule TrainTicket.Commands.Create do
  @moduledoc """
    Command to Create a ticket
  """
  @derive Jason.Encoder
  @enforce_keys [:uuid]
  defstruct [:uuid, :name]
end
