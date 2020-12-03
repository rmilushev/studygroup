defmodule Studygroup.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string
      add :age, :integer

      timestamps()
    end

  end
end
