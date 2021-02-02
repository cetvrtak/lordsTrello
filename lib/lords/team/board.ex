defmodule Lords.Team.Board do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boards" do
    field :team_name, :string, default: "Dream Team"
    field :owner, :string, default: "stevo85"
    field :role, :string, default: "manage"
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> validate_length(:title, min: 2, max: 150)
  end
end
