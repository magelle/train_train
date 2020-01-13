defmodule TrainTicket.Test.LogWriter do
  @behaviour TrainTicket.CreatedEventHandler

  @moduledoc """
    Test implementation of the log writer
  """

  def write(msg) do
    send(self(), {:msg, msg})
    :ok
  end
end
