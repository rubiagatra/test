# apr/18/2017 15:23:22 by RouterOS 6.34
# software id = AV0M-FY62
#
/interface wireless
set [ find default-name=wlan1 ] band=2ghz-b/g disabled=no frequency=auto \
    proprietary-extensions=pre-2.9.25 ssid=MainAP
set [ find default-name=wlan2 ] proprietary-extensions=pre-2.9.25
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
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
/system identity
set name=33_Doni
/system ntp client
set enabled=yes primary-ntp=17.253.84.125 secondary-ntp=52.175.34.138
/system routerboard settings
set boot-delay=1s
