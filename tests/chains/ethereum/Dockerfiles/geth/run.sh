#!/usr/bin/sh

./geth --datadir test-chain-dir --networkid $NETWORKID --ipcpath test-chain-dir/chain1.ipc  --http.port 8545 --http --http.addr "0.0.0.0"  --dev --http.corsdomain '*' --dev.period 1 --dev.gaslimit 30000000 --miner.gaslimit 30000000 --miner.gasprice 0 --txlookuplimit=0 &> log.txt
sleep 2
DEV_ADDRESS=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":1}' -H "Content-Type: application/json" http://localhost:8545 | grep -oE '0x[a-fA-F0-9]{40}' | head -n 1)

echo $DEV_ADDRESS
# Initiate all 10 addr similar to ganache
# List of account addresses
addresses="0xa89F47C6b463f74d87572b058427dA0A13ec5425
0xcBED645B1C1a6254f1149Df51d3591c6B3803007
0x00731540cd6060991D6B9C57CE295998d9bC2faB
0xF885ef252e94def5C54746218704e0122c53Bdf5
0x55797d2257292f97736A2610f2f182A9b61432D6
0x47468060B00a27F9138F007eba28127593D79523
0xA3dBD48429fb6f2309c36BFee865B74b74bd7F4E
0xCEa4C7063b8d9D40C8274a4A68fffad2F8d5eebD
0x0Ac126739bb9c448B2fF5B554abB41EC92F36dec
0x37f63b6f490C6752d1bE18604967AD102bB98883"


for address in $addresses; do
    curl -X POST --data '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from": "'$DEV_ADDRESS'", "to": "'$address'", "value": "0xffffffffffffffff" }],"id":1}' -H "Content-Type: application/json" http://localhost:8545
done

sleep 2
curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0xa89F47C6b463f74d87572b058427dA0A13ec5425", "latest"],"id":1}' http://localhost:8545

#make sure the script never exit, for container to keep running
tail -f log.txt