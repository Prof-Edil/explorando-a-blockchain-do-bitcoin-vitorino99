# Definir o TXID da transação
txid="37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517"

# Obter os detalhes da transação completa no formato JSON
transaction=$(bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getrawtransaction $txid true)

# Extrair as chaves públicas dos inputs (segundo elemento de txinwitness) e remover duplicatas
keys=$(echo "$transaction" | jq -c '[.vin[].txinwitness[1]] | unique')

# Criar o endereço multisig 1-de-4 e exibir a resposta diretamente
bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ createmultisig 1 "$keys"
