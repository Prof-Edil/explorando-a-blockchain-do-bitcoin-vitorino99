# How many new outputs were created by block 123,456?
echo bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblockhash 123456
#0000000000002917ed80650c6174aac8dfc46f5fe36480aaef682ff6cd83c3ca
echo bitcoin-cli -rpcconnect=84.247.182.145 -rpcuser=user_270 -rpcpassword=vW8nQdLUWBaJ getblock 0000000000002917ed80650c6174aac8dfc46f5fe36480aaef682ff6cd83c3ca 2 | jq '[.tx[] | .vout | length] | add'

