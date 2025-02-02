# Which tx in block 257,343 spends the coinbase output of block 256,128?
hash1=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblockhash 256128)
txid=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblock $hash1 2 | jq -r '.tx[0].txid')
hash2=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblockhash 257343)
resp=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblock $hash2 2 | jq -r --arg TXID "$txid" '.tx[] | select(.vin[].txid == $TXID) | .txid')
echo $resp
