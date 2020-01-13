defmodule TrainTicket.CreatedEventHandler do
  @moduledoc """
    Just print the events
  """
  use Commanded.Event.Handler,
    application: TrainTicket.Application,
    name: __MODULE__,
    consistency: :strong

  @log_writer Application.get_env(:train_ticket, :log_writer)

  # not required, but it ensures that any "implementation" will satisfy the interface
  @callback write(msg :: String.t()) :: :ok | :error

  def handle(%TrainTicket.Events.Created{uuid: uuid, name: name}, _metadata) do
    @log_writer.write("I received #{name} de #{uuid}")
  end
end
