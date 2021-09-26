defmodule ProjectApiWeb.ProjectView do
  use ProjectApiWeb, :view
  alias ProjectApiWeb.ProjectView

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, ProjectView, "project.json")}
  end

  def render("show.json", %{project: project}) do
    %{data: render_one(project, ProjectView, "project.json")}
  end

  def render("project.json", %{project: project}) do
    %{id: project.id,
      title: project.title,
      descritpion: project.descritpion}
  end
end
