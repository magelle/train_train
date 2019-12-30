defmodule TrainTrainWeb.TrainControllerTest do
  use TrainTrainWeb.ConnCase

  alias TrainTrain.Fleet

  @create_attrs %{name: "some name", number_of_seats: 42}
  @update_attrs %{name: "some updated name", number_of_seats: 43}
  @invalid_attrs %{name: nil, number_of_seats: nil}

  def fixture(:train) do
    {:ok, train} = Fleet.create_train(@create_attrs)
    train
  end

  describe "index" do
    test "lists all trains", %{conn: conn} do
      conn = get(conn, Routes.train_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Trains"
    end
  end

  describe "new train" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.train_path(conn, :new))
      assert html_response(conn, 200) =~ "New Train"
    end
  end

  describe "create train" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.train_path(conn, :create), train: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.train_path(conn, :show, id)

      conn = get(conn, Routes.train_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Train"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.train_path(conn, :create), train: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Train"
    end
  end

  describe "edit train" do
    setup [:create_train]

    test "renders form for editing chosen train", %{conn: conn, train: train} do
      conn = get(conn, Routes.train_path(conn, :edit, train))
      assert html_response(conn, 200) =~ "Edit Train"
    end
  end

  describe "update train" do
    setup [:create_train]

    test "redirects when data is valid", %{conn: conn, train: train} do
      conn = put(conn, Routes.train_path(conn, :update, train), train: @update_attrs)
      assert redirected_to(conn) == Routes.train_path(conn, :show, train)

      conn = get(conn, Routes.train_path(conn, :show, train))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, train: train} do
      conn = put(conn, Routes.train_path(conn, :update, train), train: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Train"
    end
  end

  describe "delete train" do
    setup [:create_train]

    test "deletes chosen train", %{conn: conn, train: train} do
      conn = delete(conn, Routes.train_path(conn, :delete, train))
      assert redirected_to(conn) == Routes.train_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.train_path(conn, :show, train))
      end
    end
  end

  defp create_train(_) do
    train = fixture(:train)
    {:ok, train: train}
  end
end
