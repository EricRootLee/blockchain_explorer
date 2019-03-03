defmodule RpcExplorerWeb.TransactionController do
  use RpcExplorerWeb, :controller
  alias RpcExplorer.Transactions


  def show(conn, %{"txid" => txid}) do
    transaction = Transactions.get_transaction(txid)
    render(conn, "show.html", transaction: transaction)
  end
end
