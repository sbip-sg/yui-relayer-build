mnemonic1="hub sudden want follow subject clog minimum tunnel fire thought click spider nation forget minor divide devote stove two category culture level wall present"

echo "$mnemonic1" | ./build/simd --home ./ keys add validator --keyring-backend="test" --recover --output json > ./validator_seed.json 
