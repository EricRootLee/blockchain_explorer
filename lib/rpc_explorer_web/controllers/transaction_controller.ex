defmodule RpcExplorerWeb.TransactionController do
  use RpcExplorerWeb, :controller
  alias RpcExplorer.Transactions

  def index(conn, _params) do
    transactions = Transactions.list_transactions()
    render(conn, "index.html", transactions: transactions)
  end

  def show(conn, %{"hash" => hash}) do
    transaction = Transactions.get_transaction(hash)
    render(conn, "show.html", transaction: transaction)
  end
end
