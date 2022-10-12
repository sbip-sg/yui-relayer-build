include ../../docker.mk

.PHONY: network
network:
	TAG=${DOCKER_TAG} $(DOCKER_COMPOSE) \
		-f ../docker-compose-test.yaml \
		up -d \
		tendermint-chain0 tendermint-chain1

.PHONY: test
test:
	./scripts/init-rly
	./scripts/handshake
	./scripts/test-tx

.PHONY: test-unauthorized
test-unauthorized:
	./scripts/init-rly-unauthorized
	./scripts/handshake-unauthorized
	./scripts/test-tx-unauthorized

.PHONY: network-down
network-down:
	TAG=${DOCKER_TAG} $(DOCKER_COMPOSE) \
		-f ../docker-compose-test.yaml \
		down --volumes --remove-orphans
