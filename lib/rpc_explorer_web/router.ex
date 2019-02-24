defmodule RpcExplorerWeb.Router do
  use RpcExplorerWeb, :router

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

  scope "/", RpcExplorerWeb do
    pipe_through :browser

    get "/block", BlockController, :index
    get "/block/:hash", BlockController, :show
    get "/transaction", TransactionController, :index
    get "/transaction/:hash", TransactionController, :show
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", RpcExplorerWeb do
  #   pipe_through :api
  # end
end
