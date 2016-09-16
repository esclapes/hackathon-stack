defmodule Web.Router do
  use Web.Web, :router
  use Terraform,
    terraformer: Web.Terraformers.Kohana

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Web do
    pipe_through :api #browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello-phoenix", PageController, :hello
  end

  # Other scopes may use custom stacks.
  # scope "/api", Web do
  #   pipe_through :api
  # end
end
