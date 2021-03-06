defmodule ProjectApi.ManagementTest do
  use ProjectApi.DataCase

  alias ProjectApi.Management

  describe "projects" do
    alias ProjectApi.Management.Project

    @valid_attrs %{descritpion: "some descritpion", title: "some title"}
    @update_attrs %{descritpion: "some updated descritpion", title: "some updated title"}
    @invalid_attrs %{descritpion: nil, title: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Management.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Management.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Management.create_project(@valid_attrs)
      assert project.descritpion == "some descritpion"
      assert project.title == "some title"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, %Project{} = project} = Management.update_project(project, @update_attrs)
      assert project.descritpion == "some updated descritpion"
      assert project.title == "some updated title"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_project(project, @invalid_attrs)
      assert project == Management.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Management.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Management.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Management.change_project(project)
    end
  end
end
