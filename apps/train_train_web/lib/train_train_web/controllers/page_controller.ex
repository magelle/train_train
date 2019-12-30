defmodule TrainTrainWeb.PageController do
  use TrainTrainWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
