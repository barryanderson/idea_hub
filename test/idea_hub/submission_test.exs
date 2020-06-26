defmodule IdeaHub.SubmissionTest do
  use IdeaHub.DataCase

  alias IdeaHub.Submission

  describe "ideas" do
    alias IdeaHub.Submission.Idea

    @valid_attrs %{comment: "some comment", open: true, status: 42}
    @update_attrs %{comment: "some updated comment", open: false, status: 43}
    @invalid_attrs %{comment: nil, open: nil, status: nil}

    def idea_fixture(attrs \\ %{}) do
      {:ok, idea} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Submission.create_idea()

      idea
    end

    test "list_ideas/0 returns all ideas" do
      idea = idea_fixture()
      assert Submission.list_ideas() == [idea]
    end

    test "get_idea!/1 returns the idea with given id" do
      idea = idea_fixture()
      assert Submission.get_idea!(idea.id) == idea
    end

    test "create_idea/1 with valid data creates a idea" do
      assert {:ok, %Idea{} = idea} = Submission.create_idea(@valid_attrs)
      assert idea.comment == "some comment"
      assert idea.open == true
      assert idea.status == 42
    end

    test "create_idea/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Submission.create_idea(@invalid_attrs)
    end

    test "update_idea/2 with valid data updates the idea" do
      idea = idea_fixture()
      assert {:ok, %Idea{} = idea} = Submission.update_idea(idea, @update_attrs)
      assert idea.comment == "some updated comment"
      assert idea.open == false
      assert idea.status == 43
    end

    test "update_idea/2 with invalid data returns error changeset" do
      idea = idea_fixture()
      assert {:error, %Ecto.Changeset{}} = Submission.update_idea(idea, @invalid_attrs)
      assert idea == Submission.get_idea!(idea.id)
    end

    test "delete_idea/1 deletes the idea" do
      idea = idea_fixture()
      assert {:ok, %Idea{}} = Submission.delete_idea(idea)
      assert_raise Ecto.NoResultsError, fn -> Submission.get_idea!(idea.id) end
    end

    test "change_idea/1 returns a idea changeset" do
      idea = idea_fixture()
      assert %Ecto.Changeset{} = Submission.change_idea(idea)
    end
  end
end
