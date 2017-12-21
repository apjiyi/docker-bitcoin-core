# Bitcoin Core v0.15.1 (regtest)

# Pre-install
+ Docker version 17.11.0-ce
+ Docker-compose version 1.13.0
+ Git

# Install
1. Setup environment `./setup.sh`
2. Build docker image `./build.sh`

# Start service
+ Execute `docker-compose up -d` (-d: daemon)

# Enter into containers
1. Execute `docker exec -it <container id/name> bash`
2. Execute `./bitcoin/src/bitcoind -daemon -reindex`
3. Execute `./bitcoin/src/bitcoin-cli getblockchaininfo`

# Stop service
+ Execute `docker-compose stop <service name>` 

# Start service
+ Execute `docker-compose start <service name>` 

# Restart service
+ Execute `docker-compose restart <service name>` 

# Stop service and Remove all containers
+ Execute `docker-compose down`



