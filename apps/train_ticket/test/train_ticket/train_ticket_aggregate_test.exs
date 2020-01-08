defmodule TrainTicketAggregateTest do
  use TrainTicket.DataCase

  import Commanded.Assertions.EventAssertions

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

  test "Should refuse to create a ticket with an existing ID" do
    uuid = UUID.uuid4()
    append_before(%Create{uuid: uuid, name: "a name"})

    assert {:error, :already_created} ==
             Application.dispatch(%Create{uuid: uuid, name: "another name"})
  end

  def append_before(event) do
    Application.dispatch(event)
  end
end
