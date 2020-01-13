defmodule TrainTicket.Storage do
  @moduledoc """
    Storage helperr which reset the event store between two tests
  """

  @doc """
  Clear the event store and read store databases
  """
  def reset! do
    reset_eventstore()
  end

  defp reset_eventstore do
    config =
      EventStore.Config.parsed(TrainTicket.EventStore, :train_ticket)
      |> EventStore.Config.default_postgrex_opts()

    {:ok, conn} = Postgrex.start_link(config)

    EventStore.Storage.Initializer.reset!(conn)
  end
end
