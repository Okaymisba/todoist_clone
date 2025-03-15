defmodule TodoistClone.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :title, :string
    field :due_date, :utc_datetime
    belongs_to :user, TodoistClone.Accounts.User

    timestamps()
  end

  
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :due_date, :user_id])
    |> validate_required([:title, :due_date, :user_id])
  end
end
