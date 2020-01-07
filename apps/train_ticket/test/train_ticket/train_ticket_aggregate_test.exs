defmodule TrainTicketAggregateTest do
  use TrainTicket.DataCase

  alias TrainTicket.Application
  alias TrainTicket.Commands.Create
  alias TrainTicket.Events.Created

  test "Should be able to create a ticket" do
    uuid = UUID.uuid4()
    name = "My new aggregate name"

    :ok = Application.dispatch(%Create{uuid: uuid, name: name})

    assert_receive_event(
      Application,
      Created,
      fn event -> assert event.uuid == uuid end,
      fn event -> assert event.name == name end
    )
  end

#  test "Should refuse to create a ticket with an existing ID" do
#    uuid = UUID.uuid4()
#    append_before [%Create{uuid: uuid, name: "a name"}]
#
#    assert :ok != Application.dispatch(%Create{uuid: uuid, name: "another name"})
#  end

  def append_before(event) do
    causation_id = UUID.uuid4()
    correlation_id = UUID.uuid4()

    event_data = %Commanded.EventStore.EventData{
      causation_id: causation_id,
      correlation_id: correlation_id,
      event_type: Commanded.EventStore.TypeProvider.to_string(event),
      data: event,
      metadata: %{},
    }

    stream_uuid = event.uuid
    expected_version = 0
    {:ok, _} = Commanded.EventStore.append_to_stream(Application, stream_uuid, expected_version, [event_data])
  end

end
