# apr/18/2017 14:23:24 by RouterOS 6.38.5
# software id = AV0M-FY62
#
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g disabled=no frequency=auto \
    ssid=MainAP
/ip address
add address=192.168.33.254/24 interface=ether1 network=192.168.33.0
/ip dhcp-client
add default-route-distance=0 dhcp-options=hostname,clientid disabled=no \
    interface=wlan1
/ip dns
set allow-remote-requests=yes servers=10.1.1.254,202.148.11.48
/ip firewall nat
add action=masquerade chain=srcnat out-interface=wlan1
/system clock
set time-zone-name=Asia/Jakarta
/system routerboard settings
set boot-delay=1s
