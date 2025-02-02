# How many new outputs were created by block 123,456?
hash=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblockhash 123456)
resp=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblock $hash 2 | jq '[.tx[] | .vout | length] | add')

echo $resp


