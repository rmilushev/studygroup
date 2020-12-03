defmodule Studygroup.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :description, :string

      timestamps()
    end

  end
end
