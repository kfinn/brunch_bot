defmodule BrunchBotWeb.Router do
  use BrunchBotWeb, :router

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

  scope "/", BrunchBotWeb do
    pipe_through :browser

    get "/", EventController, :index
    resources "/events", EventController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BrunchBotWeb do
  #   pipe_through :api
  # end
end
