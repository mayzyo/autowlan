#/bin/sh
iptables-nft -t nat -C POSTROUTING -o wg0 -j MASQUERADE && iptables-nft -t nat -D POSTROUTING -o wg0 -j MASQUERADE
iptables-nft -C FORWARD -i wg0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT && iptables-nft -D FORWARD -i wg0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables-nft -C FORWARD -i wlan0 -o wg0 -j ACCEPT && iptables-nft -D FORWARD -i wlan0 -o wg0 -j ACCEPT