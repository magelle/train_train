defmodule CreatedEventHandlerTest do
  use TrainTicket.DataCase

  alias TrainTicket.CreatedEventHandler

  @moduletag :capture_log

  doctest CreatedEventHandler

  test "module exists" do
    uuid = UUID.uuid4()
    name = "My new aggregate name"

    event = %TrainTicket.Events.Created{uuid: uuid, name: name}
    metadata = %{event_number: 1}

    assert :ok == CreatedEventHandler.handle(event, metadata)
  end
end
