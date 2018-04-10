.	#!/bin/bash


sh ./autogen.sh
./configure
make
 docker run -it -d -p 55917:55917 -p 55916:55916 --name bitcoin vlazlatoken/bitcoin-testnet-2 ./src/bitcoind -testnet --rpcport=55916 -rest -listen --rpcuser=chaindev --rpcpassword=chaindev --rpcconnect=127.0.0.1 --rpcallowip=127.0.0.1/0 --rpcallowip=138.68.8.100/0 --rpcallowip=165.227.187.187/0 --rpcconnect=165.227.187.187 --rpcconnect=138.68.8.100 --rpcconnect=174.138.7.230 --rpcallowip=174.138.7.230/0 --addnode=174.138.7.230 --addnode=138.68.8.100 --adddnode=159.65.144.38 --addnode=165.227.187.187 --rpcallowip=159.65.144.38/0 --rpcconnect=159.65.144.38 --rpcallowip=0.0.0.0/32 -server
 
./src/bitcoin-cli -testnet --rpcport=55916 -rest -listen --rpcuser=chaindev --rpcpassword=chaindev --rpcallowip=138.68.8.100/0 --rpcconnect=127.0.0.1 --rpcallowip=127.0.0.1/0 --rpcallowip=165.227.187.187/0 --rpcconnect=165.227.187.187 --rpcconnect=138.68.8.100 --rpcconnect=174.138.7.230 --rpcallowip=174.138.7.230/0 --addnode=174.138.7.230 --addnode=138.68.8.100 --adddnode=159.65.144.38 --addnode=165.227.187.187 --rpcallowip=159.65.144.38/0 --rpcconnect=159.65.144.38 --rpcallowip=0.0.0.0/32 -server