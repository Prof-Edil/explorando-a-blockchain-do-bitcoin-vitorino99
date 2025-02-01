# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`

txid="37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517"

# Obter os detalhes da transação em JSON
transaction=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getrawtransaction $txid true)

# Extrair as chaves públicas dos inputs usando jq
keys=$(echo $transaction | jq -r '[.vin[].txinwitness[1]] | unique')

# Criar o endereço multisig 1-de-4
multisig=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ createmultisig 1 "$keys")

# Exibir o endereço P2SH
echo $multisig | jq -r .address
