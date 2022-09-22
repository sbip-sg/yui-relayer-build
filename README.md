# yui-relayer-build
IBC Relayer for heterogeneous blockchains

## Build Relay
```bash
make yrly
```
## Build Tendermint docker image
``` bash
cd tests/chains/tendermint/ 
make docker-images
```

## Build fabric docker image
``` bash
cd tests/chains/fabric

make bin
make initial-data
make snapshot
make docker-images
```

## Run test
```bash
cd tests/cases/tm2fab/
make network
make test
```
