defmodule TrainTicket.Events.Created do
  @derive Jason.Encoder
  defstruct [:uuid, :name]
end
