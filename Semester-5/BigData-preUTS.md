# Big Data Pre-UTS

## Introduction (Week 1)

### References

- Buku: Big data concepts, technology, and architecture. Balamurugan Bulusamy,
- Hadoop
- [Big Data 101](https://cognitiveclass.ai)

### Penilaian
[[Jartel/preUTS|preUTS]]
- Tugas individu (15)
- Tugas Grup (20)
- Quiz (10)
- UTS (25)
- UAS (30)

### Pendahuluan / Terminologi

- 3V (syarat big data)
  - **Volume**: TB
  - Velocity: TB/sec
  - Variety: Tipe datanya
- Structured data: RDMS
- Unstructured data: NoSQL
- Semi-structured data
- Batch: kasih semua dulu, nanti baru dipake (Hadoop)
- Streaming: Real-time
- Data at rest: Data yang disimpan
- Data in motion: Data yang sedang bergerak
- Metadata: Penjelasan datanya apa

### ACID database

Acid Limitation -> No SQL -> BASE

> Tujuan big data mau database yg available dan konsisten dengan cepat

## Latar Belakang (Week 2)

Karena ada Search engine, kebutuhan mengolah data meningkat

Banyak data didistribusi antar komputer (node)
- Lalu ini mengakibatkan complexities dalam parallelism dan Concurrency, latencynya besar

Lalu muncul solusi, Google File System (GFS) untuk pemrosesan data menggunakan cluster
- Menyelesaikan Concurrency dan Fault Recovery
- Lalu dikembangkan ke **Hadoop** yang open source

Hadoop hanya bisa handle data secara batch, utk real time dikembangkan **spark**

### Batch Processing

1. Source File/SQL di-*import*
2. Data disimpen
3. Ada job utk process data
4. Data dikirim ke consumer

**Pros**:
- Hasil Analisis bisa disimpen

**Cons**:
- Latencynya tinggi

### Real Time / Kappa Architecture

1. Source kirim data ke Messaging System
2. Data diolah
3. Data dikirim ke consumer

**Pros**:
- Latency rendah

**Cons**:
- Data hilang setelah diproses

### Hybrid / Lambda Processing

Data dikirim ke Job scheduler dan prosesor real time.

Meng-solve kekurangan batch dan processing

Spark menggunakan pola ini

### Tech mapping

| Fungsi            | Nama Aplikasi |
| ----------------- | ------------- |
| Messaging System. | Kafka         |
|                   | Spark, Flink  |
| Storage           | HOFS          |
| Serving           | HBASE         |
| Job Scheduler     | Oozie         |

### Big Data Processing Steps

1. Data Collection
2. Data Fusion/Integration: Gabung data dari banyak sumber
3. Data Cleaning
4. Feature Extraction (Model bisa masuk DBMS)
5. Data mining and analytics (Bisa diambil dari DBMS)
6. Interpretation and visualisation

### Fitur yang bisa dipertimbangkan

- Processing Mode
- Delivery Guarantee: data yang masuk hanya sekali/minimal sekali
- State Management: Snapshot/Checkpoint (Fault Recovery)
- Out of order Processing
- Windowing: time-based/count based (data diolah setelah 10 menit / 10 data masuk)
- Latency

## Map Reduce (Week 6)

## Apache Spark (Week 7)

- Built in ML
- Jauh lebih cepat dari Hadoop
- Ada query language
- Bisa data streaming

### Syarat:

- Hard disk besar
- RAM besar

### Spark Concepts:

- RDD: Resilient Distributed Dataset
- Transformation: map, filter, reduce
- Action: collect, count, reduce

### Spark Context (SC)

Hal yang mengikat Spark ke cluster

### Dataframe

- Data yang diorganisasi dalam kolom
- Bisa diubah ke RDD

#### Alur

- Convert Dataframe ke RDD
- Proses RDD
- Convert RDD ke Dataframe

### Architecture

#### Partitions

- Bagian dari RDD
- Setiap partition diproses di node yang berbeda
- Jumlah partition bisa diatur

### Mode

#### Local

- Driver dan worker di local
- Untuk development

#### cluster

- Driver di local, worker di cluster
- Production level, tidak untuk diedit

