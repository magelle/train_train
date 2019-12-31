defmodule TrainTicket.Commands.Create do
  @enforce_keys [:uuid]
  defstruct [:uuid, :name]
end
