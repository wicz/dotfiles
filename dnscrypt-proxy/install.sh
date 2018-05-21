#!/usr/bin/env bash

rm -f /usr/local/etc/dnscrypt-proxy.toml
ln -s "$ZSH/dnscrypt-proxy/dnscrypt-proxy.toml" /usr/local/etc

sudo brew services start dnscrypt-proxy
