defmodule RpcExplorer.Blocks.Block do
  defstruct [:hash, :height, :transactions, :total_sent, :total_fee, :block_size]
end
