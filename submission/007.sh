# Only one single output remains unspent from block 123,321. What address was it sent to?
block_hash=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblockhash 123321)
block_data=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblock $block_hash 2)

unspent_output=""
echo "$block_data" | jq -c '.tx[] | {txid: .txid, vout: .vout[]}' | while read utxo; do
    txid=$(echo "$utxo" | jq -r '.txid')
    vout_index=$(echo "$utxo" | jq -r '.vout.n')
    utxo_check=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ gettxout "$txid" "$vout_index")

    if [[ -n "$utxo_check" ]]; then
        unspent_output=$(echo "$utxo" | jq -r '.vout.scriptPubKey.address')
        echo "$unspent_output"
        break
    fi
done
