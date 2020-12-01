defmodule Studygroup.Students.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "student" do
    field :age, :integer
    field :description, :string
    field :email, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:name, :age, :email, :description])
    |> validate_required([:name, :age, :email, :description])
  end
end
