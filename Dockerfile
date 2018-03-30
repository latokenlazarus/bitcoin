FROM ubuntu:trusty
USER root

RUN apt-get update
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-all-dev software-properties-common
RUN apt-get update
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-all-dev
RUN apt-get update
RUN apt-get install -y libminiupnpc-dev libzmq3-dev
RUN apt-get update
RUN apt-get install -y libminiupnpc-dev libzmq3-dev
RUN apt-get update
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y libdb4.8-dev libdb4.8++-dev
RUN apt-get install -y nano
RUN apt-get update
RUN apt-get install -y nano


RUN cd
RUN mkdir -p $HOME/.bitcoin
WORKDIR /opt
COPY . /opt
RUN pwd
COPY . $PWD/bitcoin.conf $HOME/.bitcoin
CMD [ "./autogen.sh" ]
CMD [ "./configure" ]
CMD [ "make" ]
CMD [ "./src/bitcoind", "-testnet", "--port=55917", "-rpcport=55916", "-rpcconnect=127.0.0.1", "-addnode=159.65.144.38", "-addnode=138.68.8.100", "-addnode=165.227.187.187", "-addnode=174.138.7.230", "-connect=159.65.144.38", "-connect=174.138.7.230", "-connect=138.68.8.100", "-connect=165.227.187.187", "-proxy=127.0.0.1:55624", "-maxconnections=100", "-minimizetotray=1", "-rpcclienttimeout=30", "-rpcuser=vlazlatoken", "-rpcpassword=repyunit7", "-server", "-listen"]

EXPOSE 55917 55916
