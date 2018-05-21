#!/usr/bin/env bash

rm -f /usr/local/etc/dnsmasq.conf
ln -s "$ZSH/dnsmasq/dnsmasq.conf" /usr/local/etc

sudo brew services start dnsmasq
