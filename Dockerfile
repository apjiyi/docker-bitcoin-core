From ubuntu:16.04
MAINTAINER jiyi@jiyi.co.uk

# ENV VAR
ENV TERM xterm 
ENV HOME /root

# Switch to /root
WORKDIR $HOME

# Update and install package
RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:bitcoin/bitcoin \
    && apt-get update \
    && apt-get install -y libdb4.8-dev libdb4.8++-dev \
    && apt-get install -y git vim build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils \
    && apt-get install -y libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev
    
RUN git clone https://github.com/bitcoin/bitcoin.git \
    && cd bitcoin \
    && git checkout v0.15.1 \
    && ./autogen.sh \
    && ./configure --enable-debug \
    && make

ADD ./docker-entrypoint.sh /entrypoint.sh 

ENTRYPOINT ["/entrypoint.sh"]