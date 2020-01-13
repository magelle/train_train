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

    receive do
      {:msg, msg} ->
        assert msg == "I received #{name} de #{uuid}"
    after
      # wait 50ms for this message, else fails
      50 -> assert false
    end
  end
end
