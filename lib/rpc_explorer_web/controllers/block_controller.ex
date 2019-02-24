defmodule RpcExplorerWeb.BlockController do
  use RpcExplorerWeb, :controller
  alias RpcExplorer.Blocks

  def index(conn, _params) do
    blocks = Blocks.list_blocks()
    render(conn, "index.html", blocks: blocks)
  end

  def show(conn, %{"hash" => hash}) do
    block = Blocks.get_block(hash)
    render(conn, "show.html", block: block)
  end
end
