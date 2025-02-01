# Obter o hash do bloco 256128
hash1=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblockhash 256128)

# Obter a transação coinbase do bloco 256128 (tx[0])
txid=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblock $hash1 2 | jq -r '.tx[0].txid')

# Obter o hash do bloco 257343
hash2=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblockhash 257343)

# Buscar a transação que gasta a saída da coinbase do bloco 256128
resp=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblock $hash2 2 | jq -r --arg TXID "$txid" '.tx[] | select(.vin[].txid == $TXID) | .txid')

# Exibir o TXID da transação que gasta a coinbase
echo $resp
