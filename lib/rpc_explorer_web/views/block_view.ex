defmodule RpcExplorerWeb.BlockView do
  use RpcExplorerWeb, :view

  def format_block_age(time) do
    seconds = System.system_time(:second) - time

    cond do
      seconds < 60 -> to_string(seconds) <> " seconds"
      seconds < 3600 -> to_string(trunc(seconds/60)) <> " minutes"
      seconds < 86400 -> to_string(trunc(seconds/3600)) <> " hours"
      seconds < 2592000 -> to_string(trunc(seconds/86400)) <> " days"
      seconds < 31536000 -> to_string(trunc(seconds/2592000)) <> " months"
      true -> to_string(trunc(seconds/31536000)) <> " years"
    end
  end

  def checkDataTransaction(type) do
    if type == "nulldata" do
      "NULL DATA TRANSACTION"
    end
  end
end
