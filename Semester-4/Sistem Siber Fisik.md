# **Sistem Siber Fisik**

Link Emas: `https://emas2.ui.ac.id/course/view.php?id=60011`

# Week 1 (Perkenalan dan pengantar)

## Kontak: F. Astha Ekadiyanto

- <astha.ekadiyanto@uilac.id>
- 082113554956
- Ruangan di CIL Pusgiwa lantai 3  

## Others

- Menggunakan AVR microcontroler  
- Disarankan baca buku Muhammad Ali Mazidi, Sarmad Naimi &Sepehr Naimi, The AVR Microcontroller and Embedded Systems: Using Assembly and C, Pearson New International Edition, Pearson, Essex, 2015
- Lee & Seshia, "Introduction to Embedded Systems - A Cyber- Physical Systems Approach", 2nd edition, UC- Berkeley, 2015 <https://ptolemy.berkeley.edu/books/leeseshia/releases/LeeSeshia_DigitalV2_2.pdf>
- ATMEL AVR Instruction Set Manual, <https://ww1.microchip.com/downloads/en/devicedoc/atmel-0856-avr-instruction-set-manual.pdf>
- AVR Simulator IDE
- `AVR Microchip Studio 5.1.208` or `Atmel Studio 6/7`

## Komposisi Penilian

- Praktikum - 20%
- Tugas/Quiz - 10%
- UTS/Proposal - 30%
- Final Project - 40%
- Attendence minimal 75% - syarat mengikuti ujian akhir

# Week 2 (Introduction to computing)

- prosesor ambil memory dalam word (multiple bit) kalau mau bit khusus harus masking

## RAM & ROM

Here's a quick definition of each term: `Hasil GPT`

- **ROM (Read-Only Memory):** A type of non-volatile storage that is typically used to store firmware or application software in plug-in cartridges.
- **Mask ROM:** A type of ROM in which the data is written during the manufacturing process and cannot be reprogrammed by the user.
- **PROM (Programmable ROM):** A form of ROM that the user can program once. Once programmed, the data on it cannot be changed and remains permanent.
- **EPROM (Erasable Programmable ROM):** A type of ROM that can be erased by exposing it to strong ultraviolet light and then reprogrammed.
- **EEPROM (Electrically Erasable Programmable ROM):** A type of ROM that can be electrically erased and reprogrammed multiple times.
- **Flash EPROM:** A type of EEPROM that allows for blocks of memory to be erased and reprogrammed in a single action or "flash."
- **RAM (Random Access Memory):** A type of computer memory that can be accessed randomly, meaning any byte of memory can be accessed without touching the preceding bytes. RAM is volatile, meaning it requires power to maintain the stored information.
- **SRAM (Static RAM):** A type of RAM that uses bistable latching circuitry to store each bit. It is faster and more reliable than DRAM but is more expensive. It does not need to be periodically refreshed. Isinya FF
- **DRAM (Dynamic RAM):** A type of RAM that stores each bit of data in a separate capacitor. It is more dense and less expensive than SRAM but requires periodic refreshing to maintain the data. Isinya kapasitor
- **NV-RAM (Non-Volatile RAM):** A type of RAM that retains data without requiring power, combining the speed of RAM with the permanence of ROM.

## Hyperthreading

- 1 cpu thread menjalankan 2 thread secara bersamaan menggunakan cache

## Von Neumann Architecture vs Harvard Architecture

- von Neumann: instruksi dan data di memory sama, memory dan data memory di memory sama. jadi busnya satu
- Harvard: instruksi dan data memory di memory berbeda. Faster, can be 1 cycle

# Week 3

- sector yang sering menggunakan semikonduktor : industri otomotif

## Microcontroller vs Microprosesor

- **Microprosesor**: isinya prosesor saja, ram rom io itu dihubungin external
  - Keterbatasannya adalah pinnya/interfacenya
- **Microcontroler**: Udah lengkap isinya udah ada ram, rom, serial port, timer, IO
  - Everything in one chip

## Others

- **System On Chip**: seakrang zamannya bbukan microcontroller, dah jadi SOC (Multirate system, clocknya gak sinkron)
- the future of chips adalah energy eficiency, cuman dinyalain saat dibutuhkan
- H flag, carry dari lower byte ke higher byte

## Tipe microcontroller

- 8 bit
  - AVR
  - PIC
  - HCS12
  - 8051
- 32 bit
  - ARM
  - PIC32

## AVR Internal Architecture

- Program bus dan memory bus dipisah
- Instruksi dan data dipisah di memory dan di bus juga terpisah
- Tidak ada bus, setiap output pin fungsinya khusus
- Tapi pinnya biasanya multifunction, untuk fungsi khusus dan untuk io parallel
- pin yang tidak dishare cuman yg gak bisa
  - vcc, gnd, clock(xtal1, xtal2), reset, analog-digital converter

## AVR Part Number

## AVR CPU

- RISC architecture
- Harvard architecture
- Component
  - ALU
  - 32 regs
  - PC reg
  - Instruction Decoder & IR
  - Flags
- Hanya 16 dari 32 register yang bisa di LDI, R16 akan load ke R0. R16-31 untuk load from input

## AVR Data Adress Space

- ada tablenya
- 0-1F: general purpose reg
- 20-5f: I/O regs
- 50-FFFF: general purpose ram

# Week 4

## Jump and Call

- compaer (a < b) pakai carry flag sub
- v: overflow flag, register gak bisa hold hasil data alu
- c: bit setelah msb 1
  - kalau dalam sub sama, tapi mungkin mul beda

## Stack

- sp, stack pointer, lokasi memori stack kosong
- untuk akses data, butuh tambah dulu
- untuk call dan ret, pakai stack pointer
- kalau ada pop, push, bisa manipulasi return address

## Time delay

- branch penalty = 2 cycle, 1 cycle saat comparenya false

# Week (IO)

# **Sistem Siber Fisik** (after UTS)

## Interrupt (Week 1)

### Polling and Interrupt

Polling:

```py
while(1):
    if(PIND.2 == 0) //do something
```

Interrupt:

```c
main(){
    //do something
}

when PIND.2 == 0, do something
```

#### Comparison

Polling:

- Menggunakan resource CPU

Interupt:

- Penggunaan CPU lebih efisien
- Interupt memiliki priority
- Saat PC shutdown, tinggal interrupt untuk nyalain
  - Kalau pake active polling, clock harus jalan terus
  - Bisa buat CPU shutdown tapi masih bisa diinterupt

### Interupt unit

- Berkomunikasi dengan bus tapi juga memiliki direct connection ke register CPU
  - Di status register (SREG) ada flag khusus (I) menandakan interupt

### Interupt vector

- Mempunyai alamat yang kasih tau jenis/asal interrupt dari mana

### Jenis-jenis interupt

- EE PROM
- ADC
- Serial

### Aplikasi

- Interrupt hanya memiliki 2 byte, jadi hanya bisa 1 command. Biasnaya Jump
  - Jadi, Interupt Service Routine (ISR) di tempat lain di memory, bukan di tempat interrupt addressnya
  - Untuk mengakhiri ISR, menggunakan RETI
- Enable enterupt pakai SEI
- Setup interupt routine tergantung interrupt vector menggunakan OUT `OUT GICR, R[nomor register]`
  - GICR itu general input register, untuk interrupt di pin (contohnya pakai button)
- GICR tulisnya gini `LDI R[nomor register], 1<<INT0` atau interupt vector lain
  - INT0 alamatnya di 0x02

### Edge vs Level Triggering

- Edge Triggering, trigger interupt saat ada perubahan bit 1 ke 0 atau 0 ke 1
= Level Triggering, trigger interupt saat 1 atau 0
- diatur di MCUCR (SE, SM2, SM1, SM0, ISC11, ISC10, ISC01, ISC00)
- Jenis interrupt diatur di 4 bit ISC
  - 2 bit untuk mengatur jenis intterupt pada INT1 (ISC01, ISC00)
  - 2 bit pada INT0 (ISC11, ISC10)
- INT2 diset menggunakan register yang berbeda dan hanya bisa rising edge atau falling edge

### Interupt Priority

- Semakin rendah program adressnya, semakin tinggi prioritasnya
- Paling tinggi reset -> general input -> timer -> dst...

### Interupt flag

- I Flag = Interupt flag
- bit ke-7 dari SREG
- I Flag akan 0 saat interupt mulai
- I Flag akan 1 saat ketemu RETI

### Context Switching

- Push dan pop register yang digunakan di interupt dan juga main function
- save juga sreg

```avrasm
main:
  ;-------
  IN R20, SREG
  ;-------

int_isr:
  ;-------
  Push R20
  ;--------
  POP R20
  RETI
```

## C Programing (Week 2)

### Data types in C

- Perhatikan bahwa AVR adalah 8-bit, jadi pilih datatype yang seminim mungkin, Kalau gak operasinya akan banyak karena penjumlahan 2 byte harus lebih banyak instruksi
- Harus memilih signed dan unsigned yang tepat, karena signed akan memakan 1 bit untuk tanda

#### Sizes

- char: 1 byte
- int: 2 byte
- long: 4 byte

### Bitwise Operation

- AND, OR, XOR, NOT
- Shift left, shift right

```c
int a;

a &= 0b00000001; // AND
a |= 0b00000001; // OR
a ^= 0b00000001; // XOR
a = ~a; // NOT
a = a << 1; // Shift left
a = a >> 1; // Shift right
```

### Other

- AVR Tool Chain: Compiler C ke avrasm
- Arduino punya toolchain sendiri

## Memory Type (Week 2)

### Flash Memory

- Program memory
- Biasa dipakai untuk program lookup
- Read only

```c
const unsigned char PROGMEM lookup[] = {5,4,2,1};

void main(){
    unsigned char a;
    a = pgm_read_byte(&lookup[2]);
}
```

### EEPROM

- Data memory
- Read and write

```c
unsigned char EEMEM data = 0x00;

void main(){
    unsigned char a;
    a = eeprom_read_byte(&data);
    eeprom_write_byte(&data, 0x01);
}
```

### RAM

- No special functions
