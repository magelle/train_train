defmodule TrainTicket.Supervisor do
  use Supervisor

  def start_link(arg \\ []) do
    Supervisor.start_link(__MODULE__, arg, name: __MODULE__)
  end

  @impl true
  def init(_arg) do
    children = [
      # Projection Ecto
      TrainTicket.Repo,

      # Application
      TrainTicket.Application,

      # Event handlers
      TrainTicket.CreatedEventHandler,

      # Projector
      TrainTicket.TrainTicketProjector
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
