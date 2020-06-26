defmodule IdeaHub.Repo.Migrations.CreateIdeas do
  use Ecto.Migration

  def change do
    create table(:ideas) do
      add :comment, :text, null: false
      add :status, :integer, default: 0, null: false
      add :open, :boolean, default: true, null: false

      timestamps()
    end

  end
end
