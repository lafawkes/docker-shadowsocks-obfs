# STAGE 0: INSTALL DEPENDENCIES
FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive


# STAGE 1: INSTALL SHADOWSOCKS-LIBEV
RUN apt-get update
RUN apt-get install -y shadowsocks-libev
COPY shadowsocks-config.json /etc/shadowsocks-libev/config.json


# STAGE 2: BUILD SHADOWSOCKS-LIBEV
RUN apt-get install -y --no-install-recommends build-essential autoconf libtool libssl-dev libpcre3-dev libev-dev asciidoc xmlto automake git curl
RUN git config --global http.sslVerify false
RUN cd /tmp && \
    git clone https://github.com/shadowsocks/simple-obfs.git && \
    cd simple-obfs && \
    git submodule update --init --recursive && \
    ./autogen.sh && \
    ./configure && make && \
    make install && \
    cp ./src/obfs-local /usr/local/bin/ && \
    cp ./src/obfs-server /usr/local/bin/


# STAGE 4: ENTRIPOINTS
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
CMD ["entrypoint.sh"]
