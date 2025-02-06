---
Tugas Pendahuluan 2
Name: Edgrant Hendrson Suryajaya
NPM: 2206025016
Class: MBD Pagi
---

# Tugas Pendahuluan 2

```text
Nama: Edgrant Hendrson Suryajaya
NPM: 2206025016
```

## 1. Jelaskan apa itu Data Direction Register (DDR) (20 poin)

![Register Pada Sebuah Port](https://i.ibb.co.com/BKTxtWWd/Port-Registers-Similar-for-Ports-C-and-D-PORTB-Port-B-Data-Register.jpg)

DDR (Data Direction Register) Digunakan untuk mengatur arah pin pada mikrokontroler (digunakan sebagai input atau output). Jika bit 1, pin dikonfigurasi sebagai output. Jika 0, pin dikonfigurasi sebagai input. Contohnya jika Data Direction Register B (DDRB) adalah 0000 0100, maka pin kedua dari B adalah output dan sisanya input.

PORT Register Digunakan untuk menulis data ke pin yang dikonfigurasi sebagai output atau untuk mengaktifkan/menonaktifkan internal pull-up resistor pada pin yang dikonfigurasi sebagai input. Jika bit pada PORT register diatur ke 1 dan pin diatur sebagai output, maka pin tersebut akan bersifat digital high, atau tegangan tinggi. Jika diatur ke 0, maka pin akan menyuplai tegangan rendah.  Dalam assembly Pin digital 10 pada ATMega328P terhubung ke bit 2 dari PORTB (PB2).

```avrasm
ldi r16, 0x04 ; 0000 0100 set PB2 jadi output
out DDRB, r16 ; Set PB2 output
ldi r16, (1 << PORTB2) ; Load mask 0000 0100 set PB2 ke high
out PORTB, r16 ; Set PB2 high, menyalakan LED
```

Referensi:
- Arduino - PortManipulation | Arduino documentation.” Available: https://docs.arduino.cc/retired/hacking/software/PortManipulation/
- Syedzainnasir. (2021, June 5). Introduction to ATmega328. The Engineering Projects. https://www.theengineeringprojects.com/2017/08/introduction-to- atmega328.html

## 2. Jelaskan apa itu External Interrupt (20 poin)

dst...