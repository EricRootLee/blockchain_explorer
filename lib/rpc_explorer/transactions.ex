defmodule RpcExplorer.Transactions do
  @moduledoc """
  The Transactions context.
  """
  alias RpcExplorer.Transactions.Transaction

  def list_transactions do
    [
      %Transaction{hash: "878b041523e38de61e13d9007d71dc32307980c5cfc8c314ae2d4db17639d8d5", amount: 0.10866509, size: 106, version: 2},
      %Transaction{hash: "878b041523e38de61e13d9007d71dc32307980c5cfc8c314ae2d4db17639d8d6", amount: 10.21607329, size: 106, version: 2},
      %Transaction{hash: "878b041523e38de61e13d9007d71dc32307980c5cfc8c314ae2d4db17639d8d7", amount: 0.6258155, size: 106, version: 2},
      %Transaction{hash: "878b041523e38de61e13d9007d71dc32307980c5cfc8c314ae2d4db17639d8d8", amount: 9.22946344, size: 106, version: 2},
      %Transaction{hash: "878b041523e38de61e13d9007d71dc32307980c5cfc8c314ae2d4db17639d8d9", amount: 0.27169085, size: 106, version: 2}
    ]
  end

  def get_transaction(hash) do
    Enum.find(list_transactions(), fn map -> map.hash == hash end)
  end

  # def get_user_by(params) do
  #   Enum.find(list_users(), fn map ->
  #     Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
  #   end)
  end
