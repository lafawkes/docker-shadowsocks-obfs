#!/bin/sh


# init
PASSWORD=${PASSWORD:-"obfspasswd"}
METHOD=${METHOD:-"chacha20-ietf-poly1305"}
LISTEN_PORT=${LISTEN_PORT:-443}
OBFS_SERVER=${OBFS_SERVER:-"tls"}


# print configs
echo "password: $PASSWORD"
echo "method: $METHOD"
echo "port: $LISTEN_PORT"
echo "obfs server type: $OBFS_SERVER"


# modify config files
sed -i "s/obfspasswd/$PASSWORD/g" /etc/shadowsocks-libev/config.json
sed -i "s/tls/$OBFS_SERVER/g" /etc/shadowsocks-libev/config.json
sed -i "s/chacha20-ietf-poly1305/$METHOD/g" /etc/shadowsocks-libev/config.json
sed -i "s/PORT/$LISTEN_PORT/g" /etc/shadowsocks-libev/config.json


# print configs
cat /etc/shadowsocks-libev/config.json


# start obfs server
ss-server -c /etc/shadowsocks-libev/config.json
