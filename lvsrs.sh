#!/bin/bash
#description : start real server
VIP = 192.168.*.*
./etc/rc.d/init.d/functions
case "$1" in
  start)
    echo " Start LVS of Real Server"
  /sbin/ifconfig lo:0 $VIP broadcast $VIP netmask 255.255.255.255 up
  echo "1" >/proc/sys/net/ipv4/conf/lo/arp_ignore
  echo "2" >/proc/sys/net/ipv4/conf/lo/arp_announce
  echo "1" >/proc/sys/net/ipv4/conf/all/arp_ignore
  echo "2" >/proc/sys/net/ipv4/conf/all/arp_announce
  ;;
  stop)
  /sbin/ifconfig lo:0 down
  echo "Close LVS Real Server"
  echo "0" >/proc/sys/net/ipv4/conf/lo/arp_ignore
  echo "0" >/proc/sys/net/ipv4/conf/lo/arp_announce
  echo "0" >/proc/sys/net/ipv4/conf/all/arp_ignore
  echo "0" >/proc/sys/net/ipv4/conf/all/arp_announce
  ;;
  *)
  echo "Usage : $0 {start|stop} "
  exit 1
esac
