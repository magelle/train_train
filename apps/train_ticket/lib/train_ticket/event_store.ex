defmodule TrainTicket.EventStore do
  @moduledoc """
    Delcration of the event store
  """
  use EventStore, otp_app: :train_ticket
end
