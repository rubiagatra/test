# apr/20/2017 11:29:11 by RouterOS 6.34
# software id = AV0M-FY62
#
/interface bridge
add name=bridge1
/interface wireless
set [ find default-name=wlan1 ] disabled=no frequency=5745 mode=\
    station-bridge proprietary-extensions=pre-2.9.25 ssid=IPIN
set [ find default-name=wlan2 ] proprietary-extensions=pre-2.9.25 ssid=\
    MikroTik
/interface pptp-client
add connect-to=10.20.200.180 disabled=no mrru=1600 name=pptp-out1 password=\
    ppp1 user=ppp1
/interface eoip
add !keepalive local-address=1.1.1.10 mac-address=02:37:96:2D:90:97 name=\
    eoip-tunnel1 remote-address=7.7.7.7 tunnel-id=7
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ppp profile
add local-address=11.11.11.11 name=profile1 remote-address=12.12.12.12
/interface bridge port
add bridge=bridge1 interface=eoip-tunnel1
add bridge=bridge1 interface=ether1
/interface pptp-server server
set enabled=yes
/interface sstp-server server
set enabled=yes
/ip address
add address=192.168.33.254/24 interface=ether1 network=192.168.33.0
/ip dhcp-client
add default-route-distance=0 dhcp-options=hostname,clientid disabled=no \
    interface=wlan1
/ip dns
set allow-remote-requests=yes servers=10.1.1.254,202.148.11.48
/ip firewall nat
add action=masquerade chain=srcnat out-interface=wlan1
/ip route
add disabled=yes distance=1 dst-address=192.168.34.1/32 gateway=7.7.7.7
/ppp secret
add name=ppp1 profile=profile1 service=pptp
/system clock
set time-zone-name=Asia/Jakarta
/system identity
set name=33_Doni
/system ntp client
set enabled=yes primary-ntp=17.253.84.125 secondary-ntp=52.175.34.138
/system routerboard settings
set boot-delay=1s
