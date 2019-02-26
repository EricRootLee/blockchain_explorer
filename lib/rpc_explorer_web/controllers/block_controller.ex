defmodule RpcExplorerWeb.BlockController do
  use RpcExplorerWeb, :controller
  alias RpcExplorer.Blocks
  alias RpcExplorer.Transactions

  @spec index(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def index(conn, _params) do
    blocks = Blocks.list_blocks()
    transactions = Transactions.list_transactions()
    render(conn, "index.html", blocks: blocks, transactions: transactions)
  end

  def show(conn, %{"hash" => hash}) do
    block = Blocks.get_block(hash)
    #transactions = Blocks.get_block_transactions(Enum.drop(block["tx"],1))
    transactions = Blocks.get_block_transactions(block["tx"])
    #total_transacted = Enum.map_reduce(transactions, 0, fn  txout, acc -> Enum.txout["vout"].value + acc end)

    render(conn, "show.html", block: block, transactions: transactions)
  end
end
