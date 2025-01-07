#!/bin/fish
# Tunnel a wireguard interface
set dev $argv[1]
set peer $argv[2]

if test -z $dev
    echo "No device specified"
    exit
end


if test -z $peer
    echo "No peer specified. Using first found"
    set peer (wg show $dev | grep '^peer:' | sed s/peer:\ //)
    if test -z $peer
        echo "Did not find peer, exiting"
        exit
    end
end

echo "Using peer $peer"

set fish_trace 1

# Update allowed ips for peer
wg set $dev peer $peer allowed-ips 0.0.0.0/0

# Mess with the routing table
# Based on the actions normally performed by wireguard
ip -4 route add 0.0.0.0/0 dev $dev table 51820
wg set $dev fwmark 51820
ip -4 rule add not fwmark 51820 table 51820
ip -4 rule add table main suppress_prefixlength 0
sysctl -q net.ipv4.conf.all.src_valid_mark=1
#iptables-restore -n
