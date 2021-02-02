defmodule LordsWeb.BoardLive.Index do
  use LordsWeb, :live_view

  alias Lords.Team
  alias Lords.Team.Board

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket), do: Team.subscribe()

    {:ok, assign(socket, :boards, list_boards())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Board")
    |> assign(:board, Team.get_board!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Board")
    |> assign(:board, %Board{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Boards")
    |> assign(:board, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    board = Team.get_board!(id)
    {:ok, _} = Team.delete_board(board)

    {:noreply, assign(socket, :boards, list_boards())}
  end

  @impl true
  def handle_info({:board_created, board}, socket) do
    {:noreply, update(socket, :boards, fn boards -> [board | boards] end)}
  end

  defp list_boards do
    Team.list_boards()
  end
end
