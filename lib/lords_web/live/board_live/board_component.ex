defmodule LordsWeb.BoardLive.BoardComponent do
	use LordsWeb, :live_component

	def render(assigns) do
		~L"""
			<div id="board-<%= @board.id %>" class="board">
				<div class="row">
					<div class="column column-10">
						<div class="board-avatar"></div>
					</div>
					<a href="boards/<%= @board.id %>"><%= @board.title %></a>
				</div>
			</div>
		"""
	end
end