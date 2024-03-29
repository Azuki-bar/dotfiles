#!/bin/sh
# original is https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/vpn-networkmanager-status

vpn="$(nmcli -t -f name,type connection show --order name --active 2>/dev/null | grep vpn | head -1 | cut -d ':' -f 1)"

if [ -n "$vpn" ]; then
	echo "VPN: $vpn"
else
	echo "VPN: DOWN "
fi
