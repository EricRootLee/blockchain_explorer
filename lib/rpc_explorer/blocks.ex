defmodule RpcExplorer.Blocks do
  @moduledoc """
  The Blocks context.
  """
  require Logger

  def list_blocks do
    task = Task.async(fn -> getblockcount() end)
    blockcount = elem(Task.await(task), 1)

    refs =
      Enum.map(
        [
          blockcount,
          blockcount - 1,
          blockcount - 2,
          blockcount - 3,
          blockcount - 4
        ],
        fn n -> getblockhash(n) end
      )

    Enum.map(refs, fn ref -> getblock(elem(ref, 1)) end)
  end

  def getinfo, do: bitcoin_rpc("getinfo")
  def getblockcount, do: bitcoin_rpc("getblockcount")

  @spec getblockhash(any()) ::
          false
          | nil
          | true
          | binary()
          | [any()]
          | number()
          | {:error, any()}
          | {:ok, any()}
          | map()
  def getblockhash(index), do: bitcoin_rpc("getblockhash", [index])

  def getblock(hash) do
    case bitcoin_rpc("getblock", [hash]) do
      {:ok, response} -> response
      {:error, reason} -> Map.get(reason, "message")
    end
  end

  def getrawtransaction(txid) do
    case bitcoin_rpc("getrawtransaction", [txid]) do
      {:ok, response} -> response
      {:error, reason} -> Map.get(reason, "message")
    end
  end

  def decoderawtransaction(hexstring) do
    case bitcoin_rpc("decoderawtransaction", [hexstring]) do
      {:ok, response} -> response
      {:error, reason} -> Map.get(reason, "message")
    end
  end

  def bitcoin_rpc(method, params \\ []) do
    with url <- Application.get_env(:bitcoin_url, :url),
         command <- %{jsonrpc: "1.0", method: method, params: params},
         {:ok, body} <- Poison.encode(command),
         {:ok, response} <- HTTPoison.post(url, body),
         {:ok, metadata} <- Poison.decode(response.body),
         %{"error" => nil, "result" => result} <- metadata do
      {:ok, result}
    else
      %{"error" => reason} -> {:error, reason}
      error -> error
    end
  end

  def get_block(hash) do
    getblock(hash)
  end

  def get_block_transactions(txs) do
    rawresults = Enum.map(txs, fn txid -> getrawtransaction(txid) end)
    Enum.map(rawresults, fn hexstring -> decoderawtransaction(hexstring) end)
  end
end
