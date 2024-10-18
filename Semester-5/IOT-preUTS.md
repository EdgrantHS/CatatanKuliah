# PreUTS

## Class Rule (Week 1)

### Notes

- Boleh pakai AI, tapi cite saat pake (Kasih tau di mana kamu kontribusi)

### Self Learning

[Deadline 3 Minggu](https://bit.ly/WiRTOS)

### Embedded vs Real Time

- Embedded System: Computer system specific
- Real Time System (RTS): Waktu yang diperlukan utk logical resultnya

### RT Characteristics

- Event-driven / Reactive: Terjadi saat suatu event terjadi
- High Cost Failure: Kalau gagal gawat
- Concurrent / Multiprogramming
- Stand-alone / Continuous Operation
- Reliability / Fault Tolerance
- Predictable

### Taxonomy

- Soft vs Hard
- Static vs Dynamic
- Periodic vs Aperiodic
  - Periodic: single rate vs multi rate
  - Aperiodic: Bounded vs Unbounded arrival interval

## Real Time System (Week 2)

> Contoh transmisi video, video call

### System Correctness

- Logical Result: Hasilnya benar
- On time

> Unit test hanya mengecek logical result, tetapi dalam RTS on time juga penting, tidak hanya program correctness

### Verifikasi On Timeness

- RTS hidden, hanya diketahui saat rusak

> ECU (Electrical Control Units), zaman sekarang prosesor 1, task-nya banyak. Jadi perlu ada task scheduling

Zaman sekarang ada offloading, beberapa komputasi ke cloud

#### Avionics

Fly by wire: Pesawat dikendalikan oleh komputer

### Control System Model

- Plant: Physical system (ex: motor)
- Sensor: Analog Input, mengukur plant (Contoh: sensor kecepatan)
- Reference: Target (Contoh: Pedal gas)
- Controller: Komputer yang mengontrol plant (Contoh: ECU), keluarannya digital
- Actuator: Analog Output, mengontrol plant. Dikendalikan controller

> SOC: System on Chip, controller, yang menerima input dan mengeluarkan output

> Edge Computing

### Modelling PID Controller

> Proportional, Integral, Derivative

PID Controller:

- Mendapat input dari sensor
- Menyimpan state variables
- Parameter Diketahui

$$e(t) = r(t) - y(t)$$
error = reference - output

Parameter PID

- Proporsional: $K_p$ seberapa cepat respons (Mengurangi rise time)
- Integral: $K_i$ seberapa besar error (Menghilangkan steady state error)
- Derivative: $K_d$ seberapa cepat error berkurang (Mengurangi overshoot)

Contoh Kode:

```c
double PID(double In) {
  out = Kp * In + Ki * InSum + Kd * InDiff;

  InSum += In;
  InDiff = In - InPrev;
  InPrev = In;

  return out;
}
```

> $K_p$ = offset, $K_i$ = steady state, $K_d$ = overshoot

### Real Time Tasks

Instance of task = job, dalam kata lain fungsionalitas kecil dari task

> Runtime task tidak bisa berubah saat berjalan, hanya bisa ikuti program awalnya (jika bisa berubah, artinya dari awal sudah ditulis untuk ada fitur itu)

### Periodic Task

Parameters:

- Period: Release time (Kapan task ini perlu dirun lagi)
- Execution Time: Computation time
- Deadline: Waktu maksimal task harus selesai
  - Absolute Deadline: Waktu dari t=0 komputer
  - Relative Deadline: Deadline dari release time
  - Jika deadline tidak ada, D = P

Notasi

$$\tau = (P, T, D)$$

- P: Period
- T: Execution Time
- D: Deadline

Solusi:

- Feasibility: Task bisa dijalankan (antara release time dan deadline)
- Phase: Shifted release time
- Jitter: Variasi waktu release time

#### Tipe Real Time System

- Hard RTS: jika deadline dilewati, hasil tidak lagi berguna
- Soft RTS: Jika deadline dilewati, hasil masih berguna

### Task State

- Ready: Task siap dijalankan
- Running: Task sedang dijalankan
- Blocked: Task sedang menunggu
- Suspended: Task dihentikan sementara

### Preemptive

- Cara kerjanya, kondisi CPU disimpan, lalu dijalankan task lain, lalu dikembalikan

## Scheduling (Week 3)

Real time bukan durasi, tetapi tepat waktu (ekspektasi) / Deadline  
Audio maximum delay 250ms (deadline)

### Static Scheduling (Clock Driven)

Disimpan pada waktu kompilasi

```txt
t = decision time
T = job / hole starting at time t
```

Ibaratnya menggunakan alarm (interrupt) yang diset saat kompilasi

> Kalau menambah task, harus recompile

#### System Utilization

Ratio Waktu yang dibutuhkan task dibagi dengan periode

$$U = \sum_{i=1}^n \frac{e_i}{p_i}$$

- $e_i$: Execution Time
- $p_i$: Period

#### Component

```txt
Scheduler
|
|-Heap
  |-Task Memory
```

#### Pros and Cons

- Pros: Simple, predictable
- Cons: Not flexible, not optimal

### Tick Scheduling

Semua task jalan saat tick, tidak ada task di antara tick

> Timer tidak harus berulang ulang, kalau pakai static, ibaratnya setiap repeat harus set alarm untuk setiap task

#### Round Robin

Queue-nya FIFO, jadi habis satu task habis waktunya, lanjut ke task paling belakang.

Kalau ada task yang udah mau selesai, tasknya tetap ditaro di belakang

#### Weighted Round Robin

### Frame

Supertick, hanya mengecek overhead setiap frame (beberapa tick)

Contohnya kalau ada task yang udah mau selesai, bisa dinaikin weightnya untuk selesai

## More Static Scheduling (Week 4)

Kekurangan static: kalau task tidak konstan, maka tidak bisa dijadwalkan

### Priority Based Scheduling

Event akan mengakibatkan scheduler bekerja untuk menentukan task mana yang dijalankan

Kalkulasi event driven:

- Timer interrupt (tetap menggunakan tick)
- Task creation
- Release of task
- Completion of task
- Deadline of task

### Automatic Priority Scheduler

1. Rate Monotonic (RM) prioritas berdasarkan periode
2. Deadline Monotonic (DM) prioritas berdasarkan deadline

Kondisi:

- Jumlah task konstan
- Task independent, periodik, dan preemptive
- Seluruh task mulai dari waktu yang sama

#### Schedulability Test

Perlu simulasi dengan waktu

$$2H + max{P_i} + max{D_i}$$

- $H$ = Hyperperiod
- $P_i$ = Period
- $D_i$ = Deadline

#### Fast Schedulability Test

RM test ($U_{RM}$ test)

Guaranteed feasible jika:

$U \le U_{RM}(n) = n(2^{1/n} - 1)$

- $U$ = Utilization
- $n$ = jumlah task

> Kalau tidak memenuhi belum tentu tidak feasible

## Dynamic Scheduling (Week 5)

### Rumus static scheduling

$$W_i(t) = e_i + \sum_{k=1}^{i-1} \lceil \frac{t}{p_k} \rceil e_k$$

- $W_i(t)$ = Waktu tunggu task $i$ pada waktu $t$
- $e_i$ = Execution time task ke-i (yang dihitung)
- $p_k$ = Period task ke-k
- $i$ = task berdasarkan prioritas

> Pada selang waktu t, task akan berjalan sesuai dengan waktu tunggu

### Time Demand Analysis

- Compute $W_i(t)$
- Jika $W_i(t) \le t$, maka task feasible pada waktu $t$

### Contoh

|        | P   | e   | D   |
| ------ | --- | --- | --- |
| Task 1 | 2   | 1   | 2   |
| Task 2 | 3   | 1   | 3   |
| Task 3 | 6   | 1/2 | 6   |

#### Task 1 (Critical Instance = 2)

- $W_1(1) = 1 + 0 = 1$ Pada waktu 1, task 1 sudah berjalan sekali selama 1

- $W_1(2) = 1 + 0 = 2$ Pada waktu 2, task 1 sudah berjalan sekali selama 1

> Waktu respons = 1, critical instance 2, jadi feasible

#### Task 2 (Critical Instance = 3)

- $W_2(1) = 1 + \lceil \frac{1}{2} \rceil 1 = 2$ Pada waktu 1, task 2 tertunda dan memiliki waktu jalan 2

- $W_2(2) = 1 + \lceil \frac{2}{2} \rceil 1 = 2$

- $W_2(3) = 1 + \lceil \frac{3}{2} \rceil 1 = 3$

> Response time = 3, critical instance 3, feasible

#### Task 3 (Critical Instance = 6)

- $W_3(1) = 1/2 + \lceil \frac{1}{2} \rceil 1 + \lceil \frac{1}{3} \rceil 1 = 1/2 + 1 + 1 = 2.5$

- $W_3(2) = 1/2 + \lceil \frac{2}{2} \rceil 1 + \lceil \frac{2}{3} \rceil 1 = 1/2 + 1 + 1 = 2.5$

- $W_3(3) = 1/2 + \lceil \frac{3}{2} \rceil 1 + \lceil \frac{3}{3} \rceil 1 = 1/2 + 2 + 1 = 3.5$

- $W_3(4) = 1/2 + \lceil \frac{4}{2} \rceil 1 + \lceil \frac{4}{3} \rceil 1 = 1/2 + 2 + 2 = 4.5$

- $W_3(5) = 1/2 + \lceil \frac{5}{2} \rceil 1 + \lceil \frac{5}{3} \rceil 1 = 1/2 + 3 + 2 = 5.5$

- $W_3(6) = 1/2 + \lceil \frac{6}{2} \rceil 1 + \lceil \frac{6}{3} \rceil 1 = 1/2 + 3 + 2 = 5.5$

> Response time = 5.5, critical instance 6, feasible

### Full Dynamic Scheduling

- Prioritas task berubah-ubah

#### Contoh Algoritme

- Time left until deadline
- Period
- Slack time left
- Release time

#### LST (Least Slack Time)

$$s_i = d_i - t - e'_i$$

- $s_i$: Slack time
- $d_i$: Deadline
- $t$: Waktu sekarang
- $e'_i$: sisa waktu eksekusi task

> Jika task belum jalan, $e'_i = e_i$

## (Week 6)

### EDF (Earliest Deadline First)

Adavantage:

- Bagus untuk task yang tidak periodik (release time tidak sama dan random)
- Complexity medium

Disadvantage:

- Hanya optimal jika preemptive
- Tidak optimal jika multicore

### Aperiodic Task

- Task yang tidak periodik (Event Based)
- Aperiodic tidak menimpa periodic job, ditempatkan pada idle slot
- Solusi agar wait time tidak terlalu lama: Slack stealing, task yang lebih cepat selesai, mengambil slack time task yang lebih lambat agar terdapat slot kosong
- Cara Slack stealing adalah meningkatkan prioritas task yang lebih cepat selesai
