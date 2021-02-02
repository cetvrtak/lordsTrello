defmodule Lords.Repo.Migrations.AddTeamNameToBoards do
  use Ecto.Migration

  def change do
  	alter table(:boards) do
  		add :team_name, :string, default: "Dream Team"
  	end

  end
end
