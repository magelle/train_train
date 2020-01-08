defmodule TrainTicket.Router do
  use Commanded.Commands.Router
  alias TrainTicket.Commands.Create
  alias TrainTicket.TrainTicketAggregate

  dispatch(Create, to: TrainTicketAggregate, identity: :uuid)
end
