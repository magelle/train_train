defmodule TrainTicket do
  use Application

  def start(_type, _args) do
    TrainTicket.Supervisor.start_link()
  end
end
