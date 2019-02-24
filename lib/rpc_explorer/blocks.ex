defmodule RpcExplorer.Blocks do
  @moduledoc """
  The Blocks context.
  """
  alias RpcExplorer.Blocks.Block

  def list_blocks do
    [
      %Block{hash: "d51145cc22c104aabd8dca0369f704ad6cc7fd116ba505d7847ac6cf130d5bbb", height: 1584288, transactions: 37, total_sent: 2352.23, total_fee: 0.006, block_size: 7140},
      %Block{hash: "d51145cc22c104aabd8dca0369f704ad6cc7fd116ba505d7847ac6cf130d5bbc", height: 1584287, transactions: 1, total_sent: 0, total_fee: 0, block_size: 232},
      %Block{hash: "d51145cc22c104aabd8dca0369f704ad6cc7fd116ba505d7847ac6cf130d5bbd", height: 1584286, transactions: 67, total_sent: 6345.51, total_fee: 0.057, block_size: 48823},
      %Block{hash: "d51145cc22c104aabd8dca0369f704ad6cc7fd116ba505d7847ac6cf130d5bbe", height: 1584285, transactions: 1, total_sent: 0, total_fee: 0, block_size: 246},
      %Block{hash: "d51145cc22c104aabd8dca0369f704ad6cc7fd116ba505d7847ac6cf130d5bbf", height: 1584284, transactions: 116, total_sent: 3674.509, total_fee: 0.031, block_size: 40192},
    ]
  end

  def get_block(hash) do
    Enum.find(list_blocks(), fn map -> map.hash == hash end)
  end

  # def get_user_by(params) do
  #   Enum.find(list_users(), fn map ->
  #     Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
  #   end)
  end
