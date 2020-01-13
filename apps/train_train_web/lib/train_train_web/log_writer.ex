defmodule TrainTrainWeb.LogWriter do
  @behaviour TrainTicket.CreatedEventHandler
  @moduledoc """
    Implementation du log writer
  """

  def write(msg) do
    IO.puts(msg)
    :ok
  end
end
