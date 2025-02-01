# Obter o hash do bloco 123321
block_hash=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblockhash 123321)

# Obter todas as transações do bloco 123321
block_data=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblock $block_hash 2)

# Percorrer todas as transações do bloco e verificar qual saída ainda não foi gasta
unspent_output=""
echo "$block_data" | jq -c '.tx[] | {txid: .txid, vout: .vout[]}' | while read utxo; do
    txid=$(echo "$utxo" | jq -r '.txid')
    vout_index=$(echo "$utxo" | jq -r '.vout.n')

    # Consultar se a saída ainda está na UTXO set
    utxo_check=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ gettxout "$txid" "$vout_index")

    if [[ -n "$utxo_check" ]]; then
        unspent_output=$(echo "$utxo" | jq -r '.vout.scriptPubKey.address')
        echo "$unspent_output"
        break
    fi
done
