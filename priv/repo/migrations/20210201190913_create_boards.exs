defmodule Lords.Repo.Migrations.CreateBoards do
  use Ecto.Migration

  def change do
    create table(:boards) do
      add :title, :string
      add :owner, :string
      add :role, :string

      timestamps()
    end

  end
end
