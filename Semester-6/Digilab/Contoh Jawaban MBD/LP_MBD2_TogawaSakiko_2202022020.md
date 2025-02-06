---
Laporan 2
Name: Edgrant Hendrson Suryajaya
NPM: 2206025016
Class: MBD Siang
---

# Laporan 2

```text
Nama: Edgrant Hendrson Suryajaya
NPM: 2206025016
```
Tuliskan program dalam bahasa Assembly (.ino kosong) untuk mengedipkan satu LED. LED diatur dengan 3 button, button pertama akan mengubah delay dari LED menjadi 1 detik, button kedua akan mengubah delay dari LED menjadi 2 detik, dan button kedua akan mengubah delay dari LED menjadi 3 detik. LED akan berkedip sebanyak 2 kali tiap tekanan button. Jika tidak ada yang ditekan, maka LED tidak menyala. 

# 1. Cantumkan kode Assembly yang lengkap beserta komentar pada tiap barisnya! (40 poin)
     
```avrasm
#define __SFR_OFFSET 0x00
#include "avr/io.h"

.global start
start:
    ; Output setup
    SBI DDRB, 5  ; pin 13 dipakai untuk output,
    
    ; Input setup
    CBI DDRB, 4  ; pin 12 dipakai untuk input, clear dulu
    SBI PORTB, 4  ; pin 12 untuk pull up,
    
    ; Input setup
    CBI DDRB, 3  ; pin 11 dipakai untuk input, clear dulu
    SBI PORTB, 3  ; pin 11 untuk pull up,
    
    ; Input setup
    CBI DDRB, 2  ; pin 10 dipakai untuk input, clear dulu
    SBI PORTB, 2  ; pin 10 untuk pull up,

    ; Toggle setup
    CLR R16  ; R16 toggle register, untuk kedap kedip
    
    ; Setup register
    LDI R21, 10  ; R21 mengatur durasi delay
    LDI R22, 2  ; R22 mengatur blinking berapa kali

MainLoop:
    SBIC PINB, 4  ; kalau button dipencet, skip next line
    JMP Cek1  ; Cek button 1
    
    LDI R21, 180  ; durasi bilnk lama
    LDI R22, 2  ; reset jumlah blink utk 2 kali

Cek1:
    SBIC PINB, 3  ; kalau button dipencet, skip next line
    JMP Cek2  ; Cek button 2
    
    LDI R21, 120  ; durasi bilnk sedang
    LDI R22, 2  ; reset jumlah blink utk 2 kali

Cek2:
    SBIC PINB, 2  ; kalau button dipencet, skip next line
    JMP Toggle  ; Cek button 3
    
    LDI R21, 60  ; durasi blink cepat
    LDI R22, 2  ; reset jumlah blink utk 2 kali

Toggle:
    COM R16  ; toggle R16, 1's complement
    BRNE LedOFF  ; kalau 0 matiin led
    
LedON:
    DEC R22  ; kurangin R22 utk blink hanya 2 kali
    BRMI LedOFF  ; jika R22 <= 0, lampu tidak nyala
    SBI PORTB, 5  ; nyalakan lampu
    JMP Delay  ; kasih delay

LedOFF:
    CBI PORTB, 5  ; Matikan lampu

Delay:
    MOV R20, R21  ; load R21 (durasi loop) sebagai outer counter
    
outerLoop:
    LDI R30, 0xFF  ; reset inner conuter
    LDI R31, 0xFF  ; reset inner conuter
    
innerLoop:
    SBIW R30, 1  ; dekremen inner counter
    BRNE innerLoop  ; jump ke inner loop kecuali inner counter 0
    
    SUBI R20, 1  ; kurangin outer counter
    BRNE outerLoop  ; loop until outer counter 0
    
    JMP MainLoop  ; balik ke program
```

# 2. Cantumkan foto rangkaian yang telah Anda buat! (20 poin)

![Rangkaian Asli](https://i.ibb.co.com/PRWfnbR/image.png)

# 3. Analisis kode yang telah Anda buat secara keseluruhan, lalu jelaskan step by step dari kode tersebut! (30 poin)

Pada Start dilakukan konfigurasi pin, program mengatur beberapa pin sebagai input dengan pull-up resistor dan satu pin sebagai output untuk LED. Selain itu juga menginisialisasi beberapa register untuk kontrol toggle LED, parameter delay, dan jumlah blink led.

Selanjutnya pada mainloop terjadi pemrosesan input, program memeriksa status dari tombol-tombol input secara berurutan. Bergantung pada tombol mana yang ditekan, program menyesuaikan durasi blinking LED.

Selanjutnya pada LedOn dan LedOff, berdasarkan input, LED akan berkedip dengan durasi dan jumlah yang ditentukan. LED dinyalakan atau dimatikan dengan toggle nilai dalam register tertentu dan register jumlah blinking akan berkurang 1. Saat register ini 0, led tidak akan nyala.

Untuk delay, durasi blinking menggunakan nested loop, memungkinkan LED untuk berkedip dalam durasi yang spesifik.

# 4. Buatlah kesimpulan dalam bentuk poin-poin secara menyeluruh! (10 poin)

- Penting untuk mengatur pin untuk input pull up dan output.
- Responsif terhadap input pengguna dengan cara mengecek terus menerus untuk input.
- Mengimplementasikan delay melalui nested loop untuk kontrol waktu tanpa hardware tambahan.
- Arduino dapat diatur menggunakan avr assembly.
