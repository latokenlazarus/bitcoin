.	#!/bin/bash


sh ./autogen.sh
./configure
make
./src/bitcoind -testnet -port=55917 -rpcport=55916 -rpcconnect=127.0.0.1 -addnode=159.65.144.38 -addnode=138.68.8.100 -addnode=165.227.187.187 -addnode=174.138.7.230 -connect=159.65.144.38 -connect=174.138.7.230 -connect=138.68.8.100 -connect=165.227.187.187 -proxy=127.0.0.1:55624 -maxconnections=100 -minimizetotray=1 -rpcclienttimeout=30 -rpcuser=vlazlatoken -rpcpassword=repyunit7 -server -listen

