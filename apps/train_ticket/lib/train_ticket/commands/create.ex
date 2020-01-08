defmodule TrainTicket.Commands.Create do
  @derive Jason.Encoder
  @enforce_keys [:uuid]
  defstruct [:uuid, :name]
end
