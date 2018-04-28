FROM ubuntu:xenial
USER root

ENV DEBIAN_FRONTEND noninteractive
RUN echo exit 0 > /usr/sbin/policy-rc.d
RUN apt-get update
RUN apt-get install -y python-software-properties
RUN apt-get install -y nano wget gcc g++ git build-essential libtool autotools-dev automake autoconf cmake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-all-dev software-properties-common
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y docker-compose automake
RUN apt-get install -y libminiupnpc-dev libzmq3-dev
RUN apt-get install -y libdb4.8-dev libdb4.8++-dev
RUN apt-get update
RUN apt-get install -y libpopt-dev doxygen xmlto
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y postgresql postgresql-server-dev-all postgresql-client postgresql-contrib
RUN apt-get update
RUN apt-get install -y postgis libpq-dev libpq5 libmysqlclient-dev
RUN add-apt-repository ppa:jtv/ppa
RUN apt-get update


COPY . /opt
RUN mkdir -p /root/.bitcoin
COPY ./bitcoin.conf /root/.bitcoin/bitcoin.conf
WORKDIR /opt/libpqxx
RUN ./configure --enable-shared
RUN make
RUN make install
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/pqxx
WORKDIR /opt
RUN ./autogen.sh
RUN ./configure
RUN make

EXPOSE 55909 55908
