defmodule TodoistClone.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoistClone.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{

      })
      |> TodoistClone.Tasks.create_task()

    task
  end
end
