#!/usr/bin/env bash

ln -sf "$ZSH/haproxy/haproxy.cfg" /usr/local/etc
ln -sf "$ZSH/haproxy/snake-oil.pem" /usr/local/etc/openssl

sudo brew services start haproxy
