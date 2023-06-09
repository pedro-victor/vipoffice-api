defmodule VipOfficeWeb.MessageController do
  use VipOfficeWeb, :controller

  @metadata %{api: "vip-office", branch: "master"}

  @spec public(Plug.Conn.t(), any) :: Plug.Conn.t()
  def public(conn, _params) do
    text = "This is a public message."
    json(conn, %{metadata: @metadata, text: text})
  end

  @spec protected(Plug.Conn.t(), any) :: Plug.Conn.t()
  def protected(conn, _params) do
    text = "This is a protected message."
    json(conn, %{metadata: @metadata, text: text})
  end

  @spec admin(Plug.Conn.t(), any) :: Plug.Conn.t()
  def admin(conn, _params) do
    text = "This is an admin message."
    json(conn, %{metadata: @metadata, text: text})
  end
end
