#/bin/sh
iptables-nft -t nat -C POSTROUTING -o wg0 -j MASQUERADE || iptables-nft -t nat -A POSTROUTING -o wg0 -j MASQUERADE
iptables-nft -C FORWARD -i wg0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT || iptables-nft -A FORWARD -i wg0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables-nft -C FORWARD -i wlan0 -o wg0 -j ACCEPT || iptables-nft -A FORWARD -i wlan0 -o wg0 -j ACCEPT