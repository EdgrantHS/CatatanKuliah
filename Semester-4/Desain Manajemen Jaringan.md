# **Desain Manajemen Jaringan Before UTS**

Link kelas: `https://lms.netacad.com/course/view.php?id=2210235`

# Week 1

## Review

### RIP (konvergensi lama)

- berdasarkan hop count (tidak peduli bandwidth)

## OSPF (Link State - saling menukar informasion)

### 5 tipe paket

- Hello (establish neighbor)
  - header
  - packet body
- Database Description (sending link state database)
- Link State Request (request for more information)
- Link State Update (response to request)
- Link State Acknowledgement

### paket yang ditukar membuat OSPF Database

- Adjacency database - Neighbor Table `show ip ospf neighbor`
- Link State Database (LSDB) - Topology Table (ALL other router in network) `show ip ospf database`
- Forwarding Database - Routing Table `show ip route`

### Algoritma Dijkstra (Shortest Path First)

### Proses operasi

- Step by step
  - bangun neighbor adjacency
  - tukar pesan link-state advertisement (LSA)
  - bangun database link-state
  - jalankan algorithm Dijkstra
  - cari jalur terpendek
- States
  - Down
  - Init: mengirim hello
  - 2-way: menerima hello
  - Exstart: menentukan DR dan BDR
  - Exchange: tukar database
  - Loading
  - Full

### Area OSPF

- Single Area OSPF
  - semua router dalam satu area (best practice areo 0)
- Multi Area OSPF
  - menggunakan banyak area
  - banyak pengelompokan router
  - semua area terhubung dengan area 0

### OSPVv3 (IPv6)

### Router Id

- 32 bit
- 32 bit IP address
- 32 bit loopback address
- 32 bit manually configured
- 32 bit highest active IP address

### wildcard-mask

- inversenya subnet mask
- contoh: /30 = 255.255.255.252 (wildcard-mask = 255-252 = 3)

### Setup single area

```cisco
conf t
network 10.10.1.1 0.0.0.0 area 0
  network network-address wildcard-mask area area-id
// Cara lain
int fa0/0
ip ospf 10 area 0
// default static route
ip route 0.0.0.0 0.0.0.0 loopback0
router ospf 10
default-information originate //bingung gw
```

### Pasive interface

- interface yang tidak mengirimkan hello
- port ke end device

### Cost

- default cost = 1
- cost = 100Mbps / bandwidth

# Week 3

## Review ospf

- area 0 = backbone
- abr (area border router) = router yang terhubung dengan area 0 dan area lain
- multiarea = area 0 + area lain, seluruh area terhubung dengan area 0

## EIGRP

- Cisco Proprietary
- Dual (Diffusing Update Algorithm)
- parsial update

## EIGRP Protocol-Dependent Module (PDM)

- Neighbor Table
  - next hop router intervace
- Topology Table
  - best path (successor)
  - Alternate path (feasible successor)
- Routing Table

## RTP (Reliable Transport Protocol)

- PDM di aplication layer, isinya neighbor, topology, dan routing table
- RTP di transport layer, mengirimkan pesan

## Hello Packet

- hello: 5 detik
- multicast di v4 dan v6

## Autonomous System

- kalau dalam 1 organisasi yang sama, bisa as yang sama
- as itu 1 organisasi yang ngatur

```cisco
router eigrp autonomous-system
```

## Command

```cisco
router eigrp 1
router eigrp autonomous-system
eigrp router-id ipv4-address
network [ip addr]
passive-interface [interface-type] [interface-number]
show ip protocols
```

# Week 4 (cyber security)

## Security Terms

- Assets:
- Vulnerability:
- threat:
- exploit:
- mitigation:
- risks:

## Threat actor

- white hat
- black hat
- grey hat

## Security tools

- password cracker
- wireless hacking
- network scanning tools, nmap
- packet crafting
- packet sniffer, wireshark
- rootkit detector
- foreinsic tools

## Attack types

- eavedropping
- data modif
- ip spoofing
- password based attack
- DOS
  - syn flood attack
  - ARP Poisoning
  - DNS attack
  - DHCP Attack
- social enginerring attack
- buffer overflow

## Malware

### Virus

- replikasi dipakai dengan user action, biasa menempel pada program laink

### Trojan horse

- aplikasi palsu

### Worm

- self replicating tanpa user action dan pakai network utk cari host lain

## Security

- VPN
- ASA Firewall (Adaptive Security Appliance)
- IDS/IDP (instrusion detection system/prevention)
- Cryptography (data confidentiality, data integrity, authentication)
  - symmetric key
  - asymmetric key
    - Diffie-Hellman

# week 5 (acl nat)

## purpose

- kontrol akses
- sequensial ceknya jadi penting urutannya
- implementasi di router
- security dengan filter network

## packet filtering

- filter berdasarkan layer 3 dan 4
- source and destination address
- source and destination port

## tipe

- standard (hanya filter layer 3)
  - source address
  - number 1-99, 1300-1999
  - **taro di deket di tujuan**
- extended (melihat layer 3 dan 4)
  - source and destination address
  - source and destination port
  - protocol
  - port
  - number 100-199, 2000-2699
  - **taro di deket di sumber**

## konfigurasi

```cisco
ip access-list extended ftp-filter
  permit tcp 192.168.1.0 0.0.0.255 any eq ftp
  permit tcp 192.168.1.0 0.0.0.255 any eq ftp-data
```

- belum diimplementasi, inbound dan outbound belum diatur
- implementasi di interface

### inbound

- setup di interface saat masuk router
- lebih efisien karena paket sudah di drop sebelum masuk router

### outbound

- setup di interface keluar dari router

### wildcard mask

- keyword
  - host: wildcard mask 0.0.0.0
  - any: wildcard mask 255.255.255.255

### aturan implementasi

setiap interface hanya boleh:  

- 1 acl inbound ipv4
- 1 acl outbound ipv4
- 1 acl inbound ipv6
- 1 acl outbound ipv6

# Week 6 (Virtual Interface)

- Nomor IP dijadikan interface virtual

## VPN Uses in real

- saat ingin membuat WAN lewat internet, perlu VPN
- VPN bisa diimplementasi di router

## Benefits

- cost effective
- secure
- scalable
- compatible

## Security concern

- Hanya nomor IP yang berubah

## Beda VPN dan NAT

- NAT mengubah nomor ip
- VPN nonmor ip jadi layer 1, jadi interface

## Tipe

- Site to site VPN
  - Ada vpn gateway (router) di setiap networkk
- Remote Access
  - dulu namanya client to site

## SSL VPN

SSL vs IPsec VPN:

- SSL (memastikan koneksi utk orang yang benar, limited encription): lebih mudah, tidak perlu install software
- IPsec (Enkripsi, limited connection identification): lebih secure, lebih kompleks

## Protocol

- GRE (Generic Routing Encapsulation)
  - Paling sering digunakan di kelas
  - encapsulate layer 3
  - bisa lewat internet
  - tidak secure

### Konfigurasi
  
```cisco
interface tunnel0
  ip address [ip] [subnet]
  tunnel source [interface] !seluruh nomor ip pada interface ini akan dijadikan nomor ip tunnel
  tunnel destination [ip] 
  tunnel protection ipsec profile [profile-name] (optional - jika ingin secure) 
```

### Kekurangan GRE

- jika menggunakan virtual switch, tidak bisa lewat
- solution, DMVPN (Dynamic Multipoint VPN)

## MPLS (Multi Protocol Label Switching)

## IPsec (Internet Protocol Security)

- confidenciality
- integrity
- authentication: IKE (Internet Key Exchange)
- Diffie-Hellman: key exchange (format identitas)
  - group 1,2,5: Depricatedd
  - group 14: 2048 bit
  - group 24: 2048 bit
  - group 15: 3072 bit
  - group 16: 4096 bit
  - group 19: 256 bit
  - group 20: 384 bit
  - group 21: 521 bit

# Week 7 (NAT)

## Jenis

- Static NAT
  - 1:1
  - public ip ke private ip
- Dynamic NAT
  - pool of public ip
  - private ip ke public ip
- PAT (Port Address Translation)
  - 1 public ip ke banyak private ip
  - private ip ke public ip

# Desain Manajeen Jaringan (After UTS)

## Week 1 (WAN)

- Bisa membuat VPN Layer 2
- WAN bandwidth kecil, karena prioritasnya ke data yang sampai terbaca

### Private dan Public WAN

- Private WAN: cuman untuk 1 customer
  - contoh WAN UI-depok ke UI-salemba
  - ada garansi service level (secure, consistent bandwidth): ada garansi berapa lama dalam satu hari koneksi putustahun
- Public WAN: untuk banyak customer

### Topologi WAN

- Point to point
- Hub and spoke (star)
- Full mesh
- Partial mesh (sering terjadi karena biaya tidak cukup untuk full mesh)
- Dual homed

#### Dual Homed

- Hub and spoke dengan 2 hub
- antar hub dihubung bus
- jika salah satu hub mati, masih bisa terhubung ke hub lain
- 2 hub divirtualisasi, jadi router ujung cuman lihat 1
- biasanya 2 hub, 2 isp yang beda

#### Carrier Conection

- single carrier
- dual carrier
- multi carrier

### Tipe

#### DSL (Digital Subscriber Line)

- Bagus untuk small network
- Tidak mobile
- Menggunakan kabel telepon, juga dapat nomor telpon
- DSLAM (Digital Subscriber Line Access Multiplexer) - DSL yang mobile

#### Campus Area Network (CAN)

- Menggunnakan fiber optic

> Fiber optic rumahan masih didobel telepon, kalau di sini fiber optic sudah terpisah. Rumaha biasa protocol PPPoE, kalau di campus sudah pakai MPLS dan BGP

- koneksi biasanya pakai T1, E1. Langsung router, tidak pakai modem

#### Metro Area Ethernet (MAN)

- Menggunakan WAN
- VPN router diaktifkan

### WAN Protocol

- layer 1 dan 2

#### Protocol layer 2

- Asynchronous Transfer Mode (ATM) [deprecated]
- Frame Relay [deprecated]
- High Level Data Link Control (HDLC) [otw deprecated] - khusus kabel serial
- Point to Point Protocol (PPP) [less used]
- Multiprotocol Label Switching (MPLS)
- Ethernet WAN (Metro Ethernet) - ethernet yang lebih dari 100m

### Terminology

- DTE (Data Terminal Equipment) - router
- DCE (Data Communication Equipment) - modem
- CPE (Customer Premises Equipment) - PC, printer, etc
- POP (Point of Presence) - Colokan ISP (kalau diputusin, internet berhenti)
- Demarcation Point - batas antara ISP dan customer
- Local Loop (last mile) - kabel dari ISP ke customer (POP ke Demarcation Point)
- CO (Central Office) - tempat ISP
- Toll Network - jaringan ISP
- Backhaul - jaringan ISP yang menghubungkan POP ke CO
- Backbone - jaringan ISP yang menghubungkan CO ke CO

### Tipe Modem

- Voiceband Modem - Dial-up modem, max 56kbps
- DSL Modem - modem standard
- CSU/DSU (Channel Service Unit/Data Service Unit) - untuk T1/E1
  - CSU -> DCE (modem)
  - DSU -> DTE (router)
- Optical Converter
- Wireless Router/Accesspoint

### Circuit Switching (layer 2)

- PSTN (Public Switched Telephone Network), legacy - telepon analog
- ISDN (Integrated Services Digital Network), legacy - telepon digital
- Switch (protocol modern) - bukan circuit switching, tapi pakai packet switching

> PSTN dan ISDN yang dipindah kabelnya, bukan yang dipindah data

### layer 1

- SDH (Synchronous Digital Hierarchy) - fiber optic
- SONET (Synchronous Optical Network) - standard US
- DWDM (Dense Wavelength Division Multiplexing) - fiber optic, banyak channel

### Optical fiber

- FTTH (Fiber to the Home) - fiber optic ke rumah
- FTTB (Fiber to the Building) - fiber optic ke gedung
- FTTN (Fiber to the Node) - fiber optic ke node/neighbourhood
