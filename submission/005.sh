# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`
transaction_raw=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517)
public_keys=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ decoderawtransaction $transaction_raw | jq -c '[.vin[].txinwitness[1]]')

resp=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ createmultisig 1 $public_keys | jq -r '.address')

echo $resp
