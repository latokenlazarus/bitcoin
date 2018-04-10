FROM ubuntu:trusty
USER root

RUN apt-get update
RUN apt-get install -y python-software-properties
RUN apt-get install -y nano doxygen build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-all-dev software-properties-common
RUN apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y libminiupnpc-dev libzmq3-dev
RUN apt-get install -y libdb4.8-dev libdb4.8++-dev


COPY . /opt
RUN mkdir -p /root/.bitcoin
COPY ./bitcoin.conf /root/.bitcoin/bitcoin.conf
WORKDIR /opt

RUN ./autogen.sh
RUN ./configure
RUN make

EXPOSE 55916 55917

