if [ ! $# -eq 1 ]
  then
    echo "Usage :'./srsepc_if_masq.sh <Interface Name>' "
    exit
fi

echo "Masquerading Interface "$1

echo 1 | tee /proc/sys/net/ipv4/ip_forward 1>/dev/null
sudo iptables -t nat -A POSTROUTING -o $1 -j MASQUERADE
