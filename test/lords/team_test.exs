defmodule Lords.TeamTest do
  use Lords.DataCase

  alias Lords.Team

  describe "boards" do
    alias Lords.Team.Board

    @valid_attrs %{owner: "some owner", role: "some role", title: "some title"}
    @update_attrs %{owner: "some updated owner", role: "some updated role", title: "some updated title"}
    @invalid_attrs %{owner: nil, role: nil, title: nil}

    def board_fixture(attrs \\ %{}) do
      {:ok, board} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Team.create_board()

      board
    end

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Team.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Team.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      assert {:ok, %Board{} = board} = Team.create_board(@valid_attrs)
      assert board.owner == "some owner"
      assert board.role == "some role"
      assert board.title == "some title"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Team.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      assert {:ok, %Board{} = board} = Team.update_board(board, @update_attrs)
      assert board.owner == "some updated owner"
      assert board.role == "some updated role"
      assert board.title == "some updated title"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Team.update_board(board, @invalid_attrs)
      assert board == Team.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Team.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Team.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Team.change_board(board)
    end
  end
end
