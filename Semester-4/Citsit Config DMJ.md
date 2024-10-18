# OSPF

## Config OSPF

ipv4  

```cisco
router ospf 1
  router-id 5.5.5.5
  network 192.168.1.0 0.0.0.255 area 0
  passive-interface S0/0/1
```

ipv6  

```cisco
ipv6 router ospf 1
  router-id ...
  network ...
  passive-interface ...
  ipv6 ospf 1 area 0
```

router priorit y  

```cisco
interface GigabitEthernet0/0
  ip ospf priority 100
```

othres  
  
```cisco
router ospf 1
  auto-cost reference-bandwidth 10000 !set cost keseluruhan
interface GigabitEthernet0/0
  ip ospf cost 100 !set cost interface manual
  ip ospf hello-interval 20
  ip ospf dead-interval 80
```

## Debug OSPF

```cisco
show ip ospf neighbor
show ip ospf interface
show ip ospf database

debug ip ospf adj
```

# EIGRP

## Config EIGRP

### ipv4

```cisco
router eigrp 100
  network 192.168.1.0 0.0.0.255
  passive-interface S0/0/1
  no auto-summary
  eigrp router-id 1.1.1.1
```

### ipv6

```cisco
ipv6 router eigrp 100
  eigrp router-id 1.1.1.1
  no shutdown
interface GigabitEthernet0/0
  ipv6 eigrp 100
```

### Metrics and Timers

```cisco
router eigrp 100
  variance 2
  traffic-share min across-interfaces
  timers active-time 3
  metric weights 0 1 0 1 0 0
```

## Debug EIGRP

```cisco
show ip eigrp neighbors
show ip eigrp topology
show ip eigrp interfaces

debug eigrp packets
```

# ACL (Access Control Lists)

## Config ACL

### Standard ACL (ipv4)

```cisco
access-list 10 permit [source] [wildcard]
access-list 10 permit 192.168.1.0 0.0.0.255
access-list 10 deny any

interface GigabitEthernet0/0
  ip access-group 10 in
```

### Extended ACL (ipv4)

```cisco
access-list 100 permit tcp [source] [wildcard] [destination] [wildcard] eq [port]
access-list 101 deny tcp 192.168.44.0 0.0.0.255 host 192.168.33.14 eq www
access-list 101 deny ip any any

interface GigabitEthernet0/0/0
  ip access-group 101 in
```

### Named ACL (ipv4)

```cisco
ip access-list standard WEB_TRAFFIC
  permit tcp [source] [wildcard] [destination] [wildcard] eq [port]
  permit tcp 192.168.1.0 0.0.0.255 host 10.1.2.3 eq www
  deny ip any any

interface GigabitEthernet0/0
  ip access-group WEB_TRAFFIC in
```

```cisco
ip access-list extended VTY-BLOCK
  permit tcp 192.168.0.0 0.0.255.255 any eq 23
  deny tcp any any eq 23
  deny ip any any

interface GigabitEthernet0/0/0
  ip access-group VTY-BLOCK out
```

### ACL for ipv6

```cisco
ipv6 access-list WEB_TRAFFIC
  permit ipv6 2001:db8:abcd:0012::/64 any eq 80
  deny ipv6 any any

interface GigabitEthernet0/0
  ipv6 traffic-filter WEB_TRAFFIC in
```

## Debug ACL

### Standard and Extended ACLs

```cisco
show access-lists
show ip access-lists
show ipv6 access-lists

debug ip packet 101 detail
```
192.168.33.14

# NAT (Network Address Translation)

## Config

### Static NAT

```cisco
ip nat inside source static 192.168.11.100 192.0.2.115
interface GigabitEthernet0/0/0
  ip nat inside
interface GigabitEthernet0/0/1
  ip nat outside
```

### Dynamic NAT

```cisco
ip nat pool NATPOOL 203.0.113.5 203.0.113.10 netmask 255.255.255.0
access-list 1 permit 192.168.1.0 0.0.0.255
ip nat inside source list 1 pool NATPOOL
interface GigabitEthernet0/0
  ip nat inside
interface Serial0/0/0
  ip nat outside
```

### PAT (Port Address Translation)

```cisco
ip nat inside source list 1 interface Serial0/0/0 overload
access-list 1 permit 192.168.1.0 0.0.0.255
interface GigabitEthernet0/0/0
  ip nat inside
interface GigabitEthernet0/0/1
  ip nat outside
```

ip nat pool POOL-1 192.0.2.116 192.0.2.118 netmask 255.255.255.0
access-list 1 permit 192.168.0.0 0.0.0.255
ip nat inside source list 1 int GigabitEthernet0/0/1 overload
interface GigabitEthernet0/0/0
  ip nat inside
interface GigabitEthernet0/0/1
  ip nat outside



## Debug

```cisco
show ip nat translations
show ip nat statistics
```

# WAN (Wide Area Network)

## Config WAN

### Serial Interface Configuration

```cisco
interface Serial0/0/0
  ip address 10.1.1.1 255.255.255.252
  encapsulation ppp
  clock rate 2000000
  no shutdown
```

### PPP Authentication

```cisco
interface Serial0/0/0
  encapsulation ppp
  ppp authentication chap
username remotehost password 0 mysecretpassword
```

## Debug WAN

```cisco
show interfaces serial 0/0/0
show ip interface brief
```

# IPSEC (IP Security)

## Config IPSEC

### Crypto ISAKMP Policy

```cisco
crypto isakmp policy 10
  encr aes 256
  authentication pre-share
  group 5
crypto isakmp key mykey address 203.0.113.6
```

### Crypto IPsec Transform Set

```cisco
crypto ipsec transform-set MYSET esp-aes 256 esp-sha-hmac 
```

### Crypto Map

```cisco
crypto map MYMAP 10 ipsec-isakmp 
  set peer 203.0.113.6
  set transform-set MYSET
  match address 100
access-list 100 permit ip 192.168.1.0 0.0.0.255 192.168.2.0 0.0.0.255
interface GigabitEthernet0/0
  crypto map MYMAP
```

## Debug IPSEC

```cisco
show crypto isakmp sa
show crypto ipsec sa
```

# GRE (Generic Routing Encapsulation)

## Config GRE

```cisco
interface Tunnel0
  ip address 10.0.0.1 255.255.255.252
  tunnel source GigabitEthernet0/0
  tunnel destination 203.0.113.6
router ospf 1
  network 10.0.0.0 0.0.0.3 area 0
```

## Debug GRE

```cisco
show interface tunnel 0
```
