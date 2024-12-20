defmodule MiniMercadoWeb.Router do
  use MiniMercadoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MiniMercadoWeb do
    pipe_through :api

    get "/products", Catalog.ProductController, :index
    get "/products/:id", Catalog.ProductController, :show
    post "/products", Catalog.ProductController, :create
    put "/products/:id", Catalog.ProductController, :update
    delete "/products/:id", Catalog.ProductController, :delete

  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:mini_mercado, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: MiniMercadoWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
