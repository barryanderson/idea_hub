defmodule IdeaHub.Submission.Idea do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ideas" do
    field :comment, :string
    field :open, :boolean, default: true
    field :status, :integer, default: 0

    timestamps()
  end

  @doc false
  def changeset(idea, attrs) do
    idea
    |> cast(attrs, [:comment, :status, :open])
    |> validate_required(:comment)
    |> validate_length(:comment, min: 5)
  end
end
