# Jartel pre-UTS

## Class Rule (Week 1)

### Grading

- UAS (25%)
- UTS (25%)
- 2 Quiz, 2 Tugas (20%) | **bobot per tugas sangat tinggi**
- Lab (30%)

> Kalau ada grup assignment, **2**-3 orang

### Others

- Jika pertemuan offline 07.45 - 09.25

### References

- Forouzan, B. A., "Data Communications and Networking" 5th Edition

### Syllabus

- 11 & 18 Sep online
- 16 Oct UTS
- 18 Des UAS

#### Lecture Summary (LS)

- LS berupa poin-poin (minimal 10 poin)
- **format nama**: LS Judul-Edgrant Henderson Suryajaya 2206025016

#### Lecture Report (LR)

- LR berupa paragraph
- **format nama**: LR Judul-Edgrant Henderson Suryajaya 2206025016

## Telecommunication Fundamental (Week 1)

### Transmission Lines

Prerequisite for successful communication:

- Understandability, kedua sisi device perlu sama komunikasinya (dua duanya analog/digital)
- Error Control, kapabilitas detect error

> Komunikasi digital biasanya dikonversi DAC ADC, seperti 2 HP saling komunkasi disalurin saluran analog.

> Komunikasi analog seperti HT langsung kirim dan terima analog

### Tipe transmission lines

#### Circuits

Physical path between points, it terminates on a port

> Traditional phonelines bisa hanya 1 conversation, digital broadbands (DSL) bisa banyak sekaligus

##### Two-wire:

2 kabel twisted pair: 1 wire utk data, satunya lagi untuk listrik

Data wire untuk recieve dan sending

> Two-wire deployed di last mile

> Telephone hammpir selalu two wire

##### Four-wire:

4 Kabel twisted pair,

> Biasa dipakai untuk trunk (di gateway besar seperti international gateway, local gateway biasa 2 wire).

### Channels

### Lines & Trunks

Lines: 1 per 1, 1 line 1 orang

Trunks: Group of lines, support group of users

#### Switching

Switching: Connecting 2 lines together, mengatur gateway (kota (Toll Switch), kecamatan, dll)

CPE Switch: Customer Premises equipment

- Private Branch Exchange (PBX): Kantor/Hotel (cuman 1 nomor, tapi ada extention)
  - "To go to reception press 2"
- Private Automatic Private Branch Exchange (PABX)

### Virtual Circuits (VC)

VC, circuit yang akan dibangun saat ingin koneksi 2 tempat (blueprint planning, mirip ARP)

Permanent Virtual Circuit (PVC): mirip ~~VPN~~ WAN dan leased line. Jaminan koneksi gak macet

Switched Virtual Circuit (SVC): Hanya selama durasi koneksinya.

### Spectrum and Bandwidth

Range of frequency, the difference between the highest and lowest frequency

$$f_{bandwidth}(Hz) = f_{max} - f{min}$$

> Bandwidth is not kecepatan, tapi frekuensi

Types:

- Narrowband:300Hz - 3400Hz
- Wideband
- Fullband

#### Terms

- Frequency in hertz
- Wavelength
- Amplitude
- Phase
- Bandwidth

#### Analog vs Digital

### Data Fundementals

Review Jarkom (Dipentingin dalam protocol)

## Wiring & Network Model (Week 2)

- Review jakom

### Addressing

- Physical Address: MAC Address
- Logical Address: IP Address
- Port Address: Port Number
- Specific Address: ID sendiri untuk port

## Wireless Tech (Week 5)

### ASO (Analog Switch Off)

- TV Menggunakan signal analog yang mengambil banyak range frekuensi
- Analog mau diganti ke channel digital yang bisa dimultiplexing
- Baru baru ini bisa ASO karena politik menyebabkan selalu diblock

### Frekuensi

- 700Mhz frekuensi ideal 5G
- Semakin rendah frekuensi, semakin panjang gelombanngnya, semakin jauh rangenya

### Spectrum reallocation

- Spektrum indosat terpisah, jadi mau spectrum refarming
- indosat digabung, xl diturunkan, telkomsen bertambah 1

### GSM

- Standard international
- Flobal System for Mobile Communication
- Voice 3.1 KHz
- Memungkinakan short message service (SMS) 16 character pada 1985

#### Channel

- Traffic channel
  - Data 13KBps
  - Dipisah menjadi uplink dan downlink frequency
- Control channel
  - Pengaturan

#### Mobile Station (MS)

- Hardware dan software user equipment
- Contoh: HP kita
- 4 komponen
  - Mobile termination (MT)
  - Terminal Equipment (TE)
  - Terminal adaptor (TA)
  - Subscriber identity module (SIM)

#### Subscriber identity module (SIM)

## Cellular communication (Week 6)

- 3, 4, 5G

## QoS dan QoE (Week 7)

Quality of Service and Quality of Experience

### Quality of Experience (QoE)

- QoE adalah delight dan annoyance dari user
- Ekspektasi subjektif user
- Dipengaruhi context dan culture
- Harus ensure kenyamanan setiap user, bukan satu user

#### Factors

- Context Factor
- User Expectation
- Device Usability
- User Personality

#### Common issues for multimedia

- Web browsing: long response time, slow rendering, unavailability of site
- Mobile TV: Visual and audio quality,stalling, buffering

#### Measurement

- Objective: task performance, time, error rate
- Subjective: Controlled experiment, Crowdsourcing, Field test, Likert scale

> Likert scale: pilihan harus genap, biar gak ada netral

