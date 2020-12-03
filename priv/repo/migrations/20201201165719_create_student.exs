defmodule Studygroup.Repo.Migrations.CreateStudent do
  use Ecto.Migration

  def change do
    create table(:student) do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :description, :string

      timestamps()
    end

  end
end
