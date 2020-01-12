defmodule TrainTicket.Test.LogWriter do
  @behaviour TrainTicket.CreatedEventHandler

  def write(msg) do
    send(self(), {:msg, msg})
    :ok
  end

end
