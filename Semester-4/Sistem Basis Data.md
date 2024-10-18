# **Sistem Basis Data Before UTS**

Link Emas: `https://emas2.ui.ac.id/course/view.php?id=60830`

# Week 1 (Perkenalan Database)

- Pakai postgresql, php, nodejs, nosql, mongodb

## Penilaian

- Tugas mingguan : 10%
- UTS : 25%
- UAS/Projek : 35%
- Quiz(opsional) : 5%
- Praktikum : 25%

## DBMS (Database Management System)

### Component

- Hardware (Lapisan Fisik)
- Software (Lapisan Logika)
  - view, tampilan data
- Aplikasi

# Week 3

## Data Model

- **Schema**: struktur database (Class)
- **Instance**: isi database (Object)

### Jenis Data Model

- High-level / conceptual data model
  - Entity-Relationship Model (ER Model)
- Low-level / physical data model
  - Relational Model
  - Network Model
  - Hierarchical Model
- Others
  - Object-Oriented Model
  - Semi-Structured Model
  - Record-based model

## Arsitektur

- 1-Tier: Database di applikasi
- 2-tier: aplikasidan database terpisah
- 3-tier: aplikasi koneksi di interface database

## Karakteristik Database

- **Real-time**: data terupdate
- **Concurrent**: banyak user
- **Persistent**: data tetap ada
- **Ad-hoc**: query

## Perancangan Database

- Analisis Persyaratan
- Obsidian

# **Sistem Basis Data** (After UTS)

## NoSQL (Week 2)

### Docker

- Lightweight containerization
- Lite Virtual Machine
- UAS membuat aplikasi menggunakan docker
  - Docker Compose (Linux)
  - Docker Desktop (Windows, Mac)

### CAP

- Consistency
  - Data sama di semua node
  - Write ke semua node
- Availability
  - Data bisa diakses
  - Read dan Write
- Partition Tolerance
  - Data tetap ada meskipun node terputus
  - Data bisa diakse

#### Aplikasi

- **C**onsistency
  - Bank
- **A**vailability
  - E-Commerce
  - Social Media
- **P**artition Tolerance
  - IoT
  - Sensor

#### Databases

- CA (SQL)
  - MySQL
  - MariaDB
- CP (NoSQL)
  - MongoDB
  - Apache HBase
  - Redis
- AP (NoSQL)
  - Cassandra
  - Riak

### Replication

- Replikasi bukan untuk backup, untuk high availability
  - Kalau server 1 ada masalah, server 2 bisa langsung digunakan
  - Kalau database rusak, data hilang

### Vectir Database

- Setiap text atau image disimpan dalam bentuk vektor
- Text yang artinya mirip vektornya juga mirip
- Jadi vector yang mirip dapat disimpan dalam satu tempat

### Code First Approach

- Membuat database dari code
