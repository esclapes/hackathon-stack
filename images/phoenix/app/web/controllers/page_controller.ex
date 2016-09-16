defmodule Web.PageController do
  use Web.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def hello(conn, _), do: send_resp(conn, 200, "hi!")
end
