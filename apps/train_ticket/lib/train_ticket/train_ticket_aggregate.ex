defmodule TrainTicket.TrainTicketAggregate do
  defstruct [:uuid, :name]

  alias TrainTicket.Commands.Create
  alias TrainTicket.Events.Created
  alias TrainTicket.TrainTicketAggregate

  # Command Handlers
  def execute(%TrainTicketAggregate{uuid: nil}, %Create{uuid: uuid, name: name}) do
    %Created{uuid: uuid, name: name}
  end

  def execute(%TrainTicketAggregate{}, %Create{}),
    do: {:error, :already_created}

  # State mutator
  def apply(%TrainTicketAggregate{}, %Created{uuid: uuid, name: name}) do
    %TrainTicketAggregate{uuid: uuid, name: name}
  end
end
