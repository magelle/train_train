defmodule TrainTicket.DataCase do
  use ExUnit.CaseTemplate

  @moduledoc """
    Helper to config storage for tests
  """

  using do
    quote do
      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Commanded.Assertions.EventAssertions
    end
  end

  setup do
    {:ok, _} = Application.ensure_all_started(:train_ticket)
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(TrainTicket.Repo)

    on_exit(
      fn ->
        :ok = Application.stop(:train_ticket)
        :ok = Application.stop(:commanded)
        # :ok = Application.stop(:eventstore)

        TrainTicket.Storage.reset!()
      end
    )

    :ok
  end
end
