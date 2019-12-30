defmodule TrainTrain.FleetTest do
  use TrainTrain.DataCase

  alias TrainTrain.Fleet

  describe "trains" do
    alias TrainTrain.Fleet.Train

    @valid_attrs %{name: "some name", number_of_seats: 42}
    @update_attrs %{name: "some updated name", number_of_seats: 43}
    @invalid_attrs %{name: nil, number_of_seats: nil}

    def train_fixture(attrs \\ %{}) do
      {:ok, train} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Fleet.create_train()

      train
    end

    test "list_trains/0 returns all trains" do
      train = train_fixture()
      assert Fleet.list_trains() == [train]
    end

    test "get_train!/1 returns the train with given id" do
      train = train_fixture()
      assert Fleet.get_train!(train.id) == train
    end

    test "create_train/1 with valid data creates a train" do
      assert {:ok, %Train{} = train} = Fleet.create_train(@valid_attrs)
      assert train.name == "some name"
      assert train.number_of_seats == 42
    end

    test "create_train/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Fleet.create_train(@invalid_attrs)
    end

    test "update_train/2 with valid data updates the train" do
      train = train_fixture()
      assert {:ok, %Train{} = train} = Fleet.update_train(train, @update_attrs)
      assert train.name == "some updated name"
      assert train.number_of_seats == 43
    end

    test "update_train/2 with invalid data returns error changeset" do
      train = train_fixture()
      assert {:error, %Ecto.Changeset{}} = Fleet.update_train(train, @invalid_attrs)
      assert train == Fleet.get_train!(train.id)
    end

    test "delete_train/1 deletes the train" do
      train = train_fixture()
      assert {:ok, %Train{}} = Fleet.delete_train(train)
      assert_raise Ecto.NoResultsError, fn -> Fleet.get_train!(train.id) end
    end

    test "change_train/1 returns a train changeset" do
      train = train_fixture()
      assert %Ecto.Changeset{} = Fleet.change_train(train)
    end
  end
end
