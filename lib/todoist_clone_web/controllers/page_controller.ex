defmodule TodoistCloneWeb.PageController do
  use TodoistCloneWeb, :controller

  def home(conn, _params) do
    if conn.assigns[:current_user] do
      streams = [TodoistClone.Tasks.list_tasks()]

      render(conn, :index, streams: streams ,layout: false)
    else
      redirect(conn, to: ~p"/users/register")
    end
  end
end
