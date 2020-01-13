defmodule TrainTicket do
  use Application

  @moduledoc """
    Train ticket App
  """

  def start(_type, _args) do
    TrainTicket.Supervisor.start_link()
  end
end
