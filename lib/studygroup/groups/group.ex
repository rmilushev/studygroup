defmodule Studygroup.Groups.Group do
  use Ecto.Schema
  import Ecto.Changeset

  schema "groups" do
    field :age, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(group, attrs) do
    group
    |> cast(attrs, [:name, :age])
    |> validate_required([:name, :age])
  end
end
