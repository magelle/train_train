defmodule TrainTrainWeb.TrainController do
  use TrainTrainWeb, :controller

  alias TrainTrain.Fleet
  alias TrainTrain.Fleet.Train

  def index(conn, _params) do
    trains = Fleet.list_trains()
    render(conn, "index.html", trains: trains)
  end

  def new(conn, _params) do
    changeset = Fleet.change_train(%Train{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"train" => train_params}) do
    case Fleet.create_train(train_params) do
      {:ok, train} ->
        conn
        |> put_flash(:info, "Train created successfully.")
        |> redirect(to: Routes.train_path(conn, :show, train))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    train = Fleet.get_train!(id)
    render(conn, "show.html", train: train)
  end

  def edit(conn, %{"id" => id}) do
    train = Fleet.get_train!(id)
    changeset = Fleet.change_train(train)
    render(conn, "edit.html", train: train, changeset: changeset)
  end

  def update(conn, %{"id" => id, "train" => train_params}) do
    train = Fleet.get_train!(id)

    case Fleet.update_train(train, train_params) do
      {:ok, train} ->
        conn
        |> put_flash(:info, "Train updated successfully.")
        |> redirect(to: Routes.train_path(conn, :show, train))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", train: train, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    train = Fleet.get_train!(id)
    {:ok, _train} = Fleet.delete_train(train)

    conn
    |> put_flash(:info, "Train deleted successfully.")
    |> redirect(to: Routes.train_path(conn, :index))
  end
end
