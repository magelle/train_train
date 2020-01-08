defmodule TrainTicket.CreatedEventHandler do
  use Commanded.Event.Handler,
    application: TrainTicket.Application,
    name: __MODULE__,
    consistency: :strong

  def handle(%TrainTicket.Events.Created{uuid: uuid, name: name}, _metadata) do
    IO.puts("J'ai reçu #{name} de #{uuid}")
  end
end
