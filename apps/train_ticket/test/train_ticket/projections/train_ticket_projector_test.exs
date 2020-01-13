defmodule TrainTicketProjectorTest do
  use TrainTicket.DataCase

  alias TrainTicket.TrainTicketProjector
  alias TrainTicket.Repo

  test "Create a ticket when receive the Created event" do
    uuid = UUID.uuid4()
    name = "My new aggregate name"

    event = %TrainTicket.Events.Created{uuid: uuid, name: name}
    metadata = %{event_number: 1}

    assert :ok == TrainTicketProjector.handle(event, metadata)

    # assert_seen_event("TrainTicketProjector", 1)
    actual = Repo.get(TrainTicket.TrainTicketProjection, uuid)
    assert actual != nil
    assert actual.uuid == uuid
    assert actual.name == name
  end
end
