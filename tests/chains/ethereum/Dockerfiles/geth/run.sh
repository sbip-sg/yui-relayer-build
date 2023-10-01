#!/bin/sh

./geth --datadir test-chain-dir --networkid $NETWORKID --ipcpath test-chain-dir/chain1.ipc  --http.port 8545 --http --http.addr "0.0.0.0"  --dev --http.corsdomain '*' --dev.period 1 --dev.gaslimit 30000000 --miner.gaslimit 30000000 --miner.gasprice 0 --txlookuplimit=0 &> log.txt
sleep 2
ADDRESS=$(curl -s -X POST --data '{"jsonrpc":"2.0","method":"eth_accounts","params":[],"id":1}' -H "Content-Type: application/json" http://localhost:8545 | grep -oE '0x[a-fA-F0-9]{40}' | head -n 1)

echo $ADDRESS
curl -X POST --data '{"jsonrpc":"2.0","method":"eth_sendTransaction","params":[{"from": "'$ADDRESS'", "to": "0xa89F47C6b463f74d87572b058427dA0A13ec5425", "value": "0xffffffffffffffff" }],"id":1}' -H "Content-Type: application/json" http://localhost:8545
sleep 2
curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0xa89F47C6b463f74d87572b058427dA0A13ec5425", "latest"],"id":1}' http://localhost:8545

#make sure the script never exit, for container to keep running
tail -f log.txt