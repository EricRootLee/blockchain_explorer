defmodule RpcExplorer.Transactions do
  @moduledoc """
  The Transactions context.
  """
  def get_transaction(txid) do
    txid
    |> getrawtransaction()
    |> decoderawtransaction()
  end

  def getrawtransaction(txid) do
    result = bitcoin_rpc("getrawtransaction", [txid])
    elem(result, 1)
  end

  def decoderawtransaction(hexstring) do
    result = bitcoin_rpc("decoderawtransaction", [hexstring])
    elem(result, 1)
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

  # def get_user_by(params) do
  #   Enum.find(list_users(), fn map ->
  #     Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
  #   end)
  end
