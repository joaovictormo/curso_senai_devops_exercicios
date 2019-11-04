#!/bin/sh
ip netns add ns1
ip netns add ns2
ip link add senai-br type bridge
ip link set dev senai-br up
ip link add veth-ns1 type veth peer name veth-ns1-br
ip link add veth-ns2 type veth peer name veth-ns2-br
ip link set veth-ns1 netns ns1
ip link set veth-ns2 netns ns2
ip link set veth-ns1-br master senai-br
ip link set veth-ns1-br up
ip link set veth-ns2-br master senai-br
ip link set veth-ns2-br up
ip -n ns1 addr add 192.168.15.10/24 dev veth-ns1
ip -n ns1 link set veth-ns1 up
ip -n ns2 addr add 192.168.15.11/24 dev veth-ns2
ip -n ns2 link set veth-ns2-up
ip addr add 192.168.15.5/24 dev senai-br
ip netns exec ns1 ip route add default via 192.168.15.5 dev veth-ns1
ip netns exec ns2 ip route add default via 192.268.15.5 dev veth-ns2
iptables -t nat -A POSTROUTING -s 192.168.15.0/24 -j MASQUERADE
