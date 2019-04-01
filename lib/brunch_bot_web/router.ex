defmodule BrunchBotWeb.Router do
  use BrunchBotWeb, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  scope "/" do
    pipe_through(:browser)
    coherence_routes()
  end

  scope "/" do
    pipe_through(:protected)
    coherence_routes(:protected)
  end

  scope "/", BrunchBotWeb do
    pipe_through :browser

    get "/", EventController, :index
  end

  scope "/", BrunchBotWeb do
    pipe_through :protected

    resources "/events", EventController
  end
end
