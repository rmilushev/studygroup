defmodule Studygroup.StudentsTest do
  use Studygroup.DataCase

  alias Studygroup.Students

  describe "student" do
    alias Studygroup.Students.Student

    @valid_attrs %{age: 42, description: "some description", email: 42, name: "some name"}
    @update_attrs %{age: 43, description: "some updated description", email: 43, name: "some updated name"}
    @invalid_attrs %{age: nil, description: nil, email: nil, name: nil}

    def student_fixture(attrs \\ %{}) do
      {:ok, student} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Students.create_student()

      student
    end

    test "list_student/0 returns all student" do
      student = student_fixture()
      assert Students.list_student() == [student]
    end

    test "get_student!/1 returns the student with given id" do
      student = student_fixture()
      assert Students.get_student!(student.id) == student
    end

    test "create_student/1 with valid data creates a student" do
      assert {:ok, %Student{} = student} = Students.create_student(@valid_attrs)
      assert student.age == 42
      assert student.description == "some description"
      assert student.email == 42
      assert student.name == "some name"
    end

    test "create_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Students.create_student(@invalid_attrs)
    end

    test "update_student/2 with valid data updates the student" do
      student = student_fixture()
      assert {:ok, %Student{} = student} = Students.update_student(student, @update_attrs)
      assert student.age == 43
      assert student.description == "some updated description"
      assert student.email == 43
      assert student.name == "some updated name"
    end

    test "update_student/2 with invalid data returns error changeset" do
      student = student_fixture()
      assert {:error, %Ecto.Changeset{}} = Students.update_student(student, @invalid_attrs)
      assert student == Students.get_student!(student.id)
    end

    test "delete_student/1 deletes the student" do
      student = student_fixture()
      assert {:ok, %Student{}} = Students.delete_student(student)
      assert_raise Ecto.NoResultsError, fn -> Students.get_student!(student.id) end
    end

    test "change_student/1 returns a student changeset" do
      student = student_fixture()
      assert %Ecto.Changeset{} = Students.change_student(student)
    end
  end
end
