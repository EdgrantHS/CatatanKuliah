# **Sistem Operasi Before UTS**

# Week 1/2

## Random

- Multithreading menggunakan pthread
- Kalau sempet belajar docker dan blockchain
- Pake linux ubuntu, kalau mau pake vm juga boleh
- belajar sendiri dari redhat, nanti dikasih course

## Bobot

- Tugas 4 kali - 25%
- Kuis 2 kali - 15%
- UTS - 25%
- UAS - 35%

## Kernel

- inti

## Fungsi Utama

- Mengatur siapa dapat akses
- Resources
  - **Allocation** : Memberi memori
  - **Protection** : protect isi memori
  - **Reclamation** : delete memori yg udah gak perlu
  - **virtualization** : ram tambahan di hard disk

## Disket

- old floppy disk
- OS dulu di disket

## History

- **Dark Age** - Big room computer
  - sign-up sheet/ queue on the wall
- **Batch** - masih hanya dipakai untuk compute, menggunakan punch card
  - Read tape
  - run it
  - write output to tape
  - read the next job, repeat
- **Multiprograming** - bisa jalanin banyak program
  - batch hanya ketauan salah saat output di akhir
  - Bisa multiple user bersamaan
  - Task can be same period of time (not bersamaan, kinda kayak pipeline)
- **Multics** - hundreds of user at the same time
- **UNIX** - proprietary
  - LINUX - open source
- **PC era**  
  - IBM pc pertama pake intel prosesos
  - mencari os CP/M
    - CP/M menolak
    - IBM akhirnya dari bill gates buat DOS, dan akhirnya jadi MS-DOS

# Week 3

## Process

- proses adalah program yang dijalakan dalam memori
  - program di harddisk tidak ngapa-ngapain (file.exe)
- proses adalah instance program di memori, kalau program dijalankan 2 kali, akan ada 2 proses di memori
- proses yang lebih tinggi bisa interupt
- kalau banyak program yg sama, itu pseudoparallelism
  - kalau program nganggur, gak pakai cpu
  - kalau perlu, akan interrupt cpu
- **fork**: dalam c, pekerjaan mencabangkan sendiri, dalam proses, bisa buat proses baru
- setiap proses ada state sendiri untuk simpe state saat cpu berubah
- **deamond process**: background process

## Multiprogramming

- satu saat atomik hanya 1 program yg jalan tapi ganti gantian
- pseudoparallelisme, seakan-akan independent

## Process creation

- System initialization (saat OS baru buka)
- Exekusi proses by system call
- user buat proses baru
- batch program (dari proses lain buat proses)
- **fork**: system call untuk membuat proses baru
  - membuat clone (child) yang sama persis seperti parentnya

## Process termination

- normal exit (voluntary)
- error exit (voluntary)
- Fatal error (involuntary)
- killed by another process

## Process hierarchies

- parent dan child sebagai 1 grup

## Process state

!TODO: Cari di linux gimana nentuin proses statenya gimana

- running
- blocked
- ready

## Scheduler

- **mengatur penjalanan proses**
- Paling simple round robbin
- ada priority based
- ada scheduler asumsi based, prediksi proses kelarnya berapa lama
  - bisa kerjakan proses yang butuh waktu dikit dulu
  - fairness formula

## Interrupt Vector

## Modeling Multiprogramming

## Probabilstic Viewpoint

- proses mayoritas menunggu I/O
$$cpu utillization = 1 - p^{n}$$
- kalau hanya 20%, hanya 2 layer multiprosesor, 100% cpu kepakai
- kalau 80%, bisa jauh lebih banyak

## Exec Family

## Fork

```c
getppid(); //parent id
getpid(); //this id

pid_t a = fork();

a == 0, di child success
a > 0, di parent, return child id
a < 0, failed
```

# Week 4 (Threads)

## Definisi

- Traditional OS membuat satu thread sebagai proses yang memiliki address space sendiri
  - Sudut pandang thread address spacenye relatif ke 0
  - OS memiliki tabel utk seluRUh adress space proses
- OS baru bisa satu process menggunakan banyak thread yang setiap thread berbagi address space dari prosesnya

## Contex Switching

- **Switching dari satu thread ke thread lain**
- sudah disimpan state yang terkait sebelum berubah
  - tapi tidak semua state, yang yang penting

## Fungsi

- Kalau proses CPU bonded (banyak proses yang butuh CPU), tidak terlalu baik menggunakan thread
- Kalau proses I/O bonded (banyak proses yang butuh I/O), lebih baik menggunakan thread

## Thread Model

- Setiap thread ada state sendiri
  - PC
  - Registers
  - Stack

![thread model](https://cdn.discordapp.com/attachments/899537507409072140/1212933573972197407/image.png?ex=65f3a36b&is=65e12e6b&hm=b2d771f009a27a7a4a99f72e407dcd13d299da0506433307e43fdd59f702ab90&)

## Thread vs Process

![thread vs proses](https://cdn.discordapp.com/attachments/899537507409072140/1212933911517331456/image.png?ex=65f3a3bb&is=65e12ebb&hm=4a5284b4b2e581195c3b061bb399a09bc64485fcf958822ca65bb1d4a1f700fd&)

## Posix Thread (Pthread)

### Fuction

- **pthread_create**        : membuat thread baru
- **pthread_exit**          : keluar dari thread
- **pthread_join**          : menunggu thread lain
- **pthread_yield**         : memberi kesempatan thread lain
- **Pthread_attr_init**     : inisialisasi atribut thread
- **Pthread_attr_destroy**  : menghapus atribut thread

## Penempatan

### User space

- advantage
  - lebih cepat
  - lebih mudah
  - lebih aman
  - no trap
  - no cashe flush
- disadvantage
  - tidak bisa mengakses kernel space

### Kernel Space

- advantage
  - bisa mengakses semua
- disadvantage
  - lebih lambat
  - lebih sulizz
  - lebih berbahaya

### Hybrid

## Pop-up Thread

- Thread yang dibuat saat dibutuhkan
- Saat selesai, thread dihapus
- biasa saat ada request di distributed system

## Making code multithreaded

# Week 5 (Prosess vs thread creation time)

- Lab

# Week 6 (Process Problems)

- Race Condition

## Solusi

- Mutual Exclusion
- Critical Section

## Contoh

```asm
.L3:
  movl  mails(%rip), %eax
  addl  $1, %eax
  movl  %eax, mails(%rip)
```

- **mails** adalah variabel global
- movl mails(%rip), %eax : mengambil nilai mails ke eax
- addl $1, %eax : menambahkan 1 ke eax
- movl %eax, mails(%rip) : memasukkan nilai eax ke mails

# Week 7 (Process Scheduling)

- Menagtur jalannya process

## Process Behavior

- Long burst: CPU bound
- Short Burst: I/O bound

## Schedule when

- Process terminates
- Process blocks (Semaphore)
- I/O request

## Schduling Algorithm

### Batch

- First come first serve
  - easy to implement
  - not fair

- Shortest job first
  - optimal
  - non preemptive
  - harum mengetahui waktu proses

- Shortest remaining time next
  - preemptive
  - optimal
  - harus mengetahui waktu proses

### Real-time

- Hard real-time
  - harus selesai dalam waktu tertentu
  - tidak boleh terlambat
  - misal: control system

- Soft real-time
  - boleh terlambat
  - misal: video streaming

### Interactive

- Round Robin
  - overhead banyak
  - 20ms - 50ms optimalnya
  - tidak perlu mengetahui waktu proses

- Priority
- Multilevel Queue
- lottery (gacha)
- fair share

## Goals

### All system

- Fairness, dapat cpu time yang sama
- Balance
- Policy enforcement

### Batch System

- Throughput, maximum job per hour
- Turnaround time, waktu dari submit sampai selesai
- CPU utilization, seberapa banyak cpu dipakai

### Interactive System

- Response time, waktu dari submit sampai ada respon
- Proportionality, meets user expectation

### Real-time System

- Meeting deadlines, avoid loosing data
- Predictability, avoid quality degradation

## Thread Scheduling

- User level thread
  - thread scheduling di user level
  - thread scheduling di kernel level
- Kernel level thread
  - thread scheduling di kernel level

# **Sistem Operasi** (After UTS)

## File System (Week 1)

- Mencegah suatu file terhubung
- Solusinya pakai linkedlist

### Links

- **Hard link**: file yang punya 2 nama
  - kalau dihapus, file tetap ada
  - kalau diubah, file tetap sama di kedua nama
  - di hardisk cuman ada 1 file
  - menunjuk ke inode
- **Soft link (Symbolic Link)**: file yang punya 2 nama
  - kalau dihapus, file hilang
  - kayak shortcut windows
  - bisa link ke folder
  - menunjuk ke path file/folder

#### Command

```sh
ln ../file1.txt file2.txt # hard link
ln -s ../file1.txt file2.txt # soft link

ls -li # lihat inode
ls -la # lihat semua file
```

## Memory Management (Week 2)

- Single program at a time: dulu cuman bisa jalan 1 program
- Lalu perkembangannya, bisa swap new program into memory from disk and send old one to disk
  - Di ram masih 1 program, tapi bisa pseudo multitasking
  - Dulu OS fungsi utamanya, swap program
- Lalu ada perkembangan, bisa load program ke memory yang kosong
  - Program bisa jalan di memory yang kosong
  - Kekurangannya, program akses memory dengan alamat langsung, bisa jadi security issue, atau program crash yg program coba akses memory yang punuya progra lain
  - Disebut no abstraction memory
- Static relocation (ada bagian sendiri)
- Address space (ada bagian sendiri)

### Static relocation

- CPU akan mengubah instruksi (contohnya `JMP 1000`) menjadi `JMP 2000` karena program di load di alamat 1000
- Kekurangannya lambat (harus cek seluruh perintah program) dan tidak bisa di beberapa insturksi seperti `MOV` register

### Address Space

- Menerapkan mapping, seperti nomor telfonn, indonesia ada +62, amerika +1

#### Base dan Limit Register

- Base register: alamat awal program
- Limit register: panjang program (berapa banyak memory yang perlu reserve)

#### Kekurangan

- Setiap instruksi harus tambah base register, jadi lambat

#### Terapan Modern

- Memory Allocation
- Virtual Memory
  - Data yang ada di ram, disimpina di hardisk
- Swapping
  - Cara OS untuk mengganti program
  - Bisa mengalokasi data tambahan jika program meminta
  - Caranya dengan ada Stack segment, Data segment, dan Program segment yang berbeda
  - Data segment bisa diexpand ke bagian kosong stack segment
- Paging
  - Setiap memory dikasih nomor
  - di virtual memory, memory dibagi jadi page berdasarkan nomornya
  - di MMU (Memory Management Unit) ada page table yang menunjuk ke alamat memory
  - Page fault: ketika program akses memory yang tidak ada di ram, OS akan cari di hardisk

## Cara OS managing memory kosong

### Bitmaps

- ada bitmap (sebuah variabel) yang isinya 0 dan 1, kalau 0 berarti bagiam memory itu kosong, kalau 1 berarti terisi
- kekurangannya, kalau memory besar, bitmap juga besar

### Linked list

- Node ada info `P` (process) atau `H` (Hole)
- Kalau `P` artinya ada prosess dan memory dipakai
- Kalau `H` artinya memory kosong

#### Contoh

`[P, 0, 5, NEXT] -> [H, 5, 10, NEXT] -> [P, 15, 5, NEXT] -> [H, 20, 10, NULL]`

> ada process di alamat 0, panjang 5,  
> lalu ada hole di alamat 5, panjang 10  
> lalu ada process di alamat 15, panjang 5,  
> lalu ada hole di alamat 20, panjang 10  

#### Metode Memory Allocation Linekd List

- Next Fit (cari hole yang paling dekat)
- Best Fit (cari hole yang paling kecil)
- Worst Fit (cari hole yang paling besar)
- Quick Fit (gabungan dari beberapa metode di atas)
