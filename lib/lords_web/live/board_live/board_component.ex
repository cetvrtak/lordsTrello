defmodule LordsWeb.BoardLive.BoardComponent do
	use LordsWeb, :live_component

	def render(assigns) do
		~L"""
			<div id="board-<%= @board.id %>" class="board">
				<div class="row">
					<div class="column column-10">
						<div class="board-avatar"></div>
					</div>
					<div class="column column-90 board-title">
						<b><%= @board.title %></b>
						(<%= @board.owner %>)
						(<%= @board.team_name %>)
					</div>
				</div>
			</div>
		"""
	end
end