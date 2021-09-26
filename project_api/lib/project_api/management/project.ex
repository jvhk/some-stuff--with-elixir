defmodule ProjectApi.Management.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :descritpion, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:title, :descritpion])
    |> validate_required([:title, :descritpion])
  end
end
