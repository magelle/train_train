defmodule TrainTrainWeb.LogWriter do
  @behaviour TrainTicket.CreatedEventHandler

  def write(msg) do
    IO.puts(msg)
    :ok
  end

end
