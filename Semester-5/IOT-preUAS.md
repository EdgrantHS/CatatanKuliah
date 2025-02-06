# PreUAS

## Aperiodic Task (Week 2)

### Review

- Aperiodic: Arrival time is not periodic dan tidak punya deadline
- Sporadic: Arrival time is not periodic dan punya deadline

### Latest Release Time (LRT)

- Release time terakhir dari task yang sudah ada di sistem
- Release time diperlakukan sebagai deadline, dan deadline diperlakukan sebagai release time
- Jobs scheduled backward
- Akibatnya, task akan ditarik ke belakang dan banyak slot tersisa di depan

### Rumus Sporadic (Halaman 22-24)

### Prioritas

1. Periodic task
2. Sporadic task
3. Aperiodic task

### Deferrable Server

- Sporadic jobs untuk menyelesaikan deadline
- Aperiodic task itu response time untuk user experience

#### Prinsip

- Aperiodic task diberi slot untuk setiap periode, jika ada task yang datang, task tersebut akan dijadwalkan di slot yang tersedia, jika tidak ada task yang datang, slot tersebut akan sleep/idle

#### Background Poller

- Memiliki periode polling yang lebih kecil dari periode task
- Prioritas paling tinggi dibanding oleh task yang lain

#### Trade off

- Periode polling yang kecil akan menghabiskan slot dan respon time menjadi lebih cepat
- Budget polling yang besar akan menghabiskan slot dan eksekusi aperiodic task dapat lebih banyak

#### Urm

Halaman (52-54)

## Data Processing (Week 4)

### Orang SMP membuat unlock motor pakai KTP

- Identification device vs security device
- Identification device: KTP, platpolisi
- Security device: Fingerprint, retina, face recognition
- Jangan menggunakan identification device sebagai security device, data dapat diakses oleh orang lain dan dipalsukan

### WSN (Wireless Sensor Network)

- Setiap node transiver
- Setiap node bisa transmit dan recieve

### Data Dissemiination

- Bagaimana bisa mengirim perintah ke sebuah sensor network
- Mengirim perintah ke node yang ada di jaringan

### Data Gathering

- Mengumpulkan data dari node yang ada di jaringan
- Bagaimana bisa mengumpulkan data secara efisien, bukan semua node memberi karena bisa jutaan node

### Data Aggregation

- Menyimpuulkan data dari banyak node
- Yang dikirimkan hanya data yang penting

### Data Collection Model

- Source kirim data secara periodik

### Data Diffusion Model

- Source: Node yang mengirimkan data
- Event: Sesuatu yang perlu dilaporkan (Contoh: suhu abnormal)
- Sink: Node yang asal mengirim request (tujuan dari data)

### Data Dissemintation process

- Interest propogation: Setiap event yagn sink intrested, dia mengirim intrest dia dipropogasi braodcast ke neighmornya
- Data dissemination: Saat ada event, source report ke sink

> Yang dicari datanya, bukan address dari 1 node. Tidak penting untuk pengalamatan ke 1 node khusus.

### Event propogation

#### Flooding

Mengirim seluruh neighbor

- Implosion: rebroadcasting
- Overlap: Data diterima redundan
- Resource blindness

#### Gossiping

Mengirim random selected neighbor

- Tidak menjamin setiap network terjangkau, tapi tidak apa apa krn kita mau data area, bukan node khusus

#### Rumor

Mengirim randomly selected neighbor tapi juga membangun path, data akan balik ke sink dengan path tersebut

#### Sequential Assignment Routing (SAR)

Membangun pohon berdasarkan distribusi

- Data centric & Application aware
- Node request interest berdasarkan named data
- Intreset dissemination membuat gradient
- DLL
- Mirip eigrp

### SPIN (Sensor Protocols for Information via Negotiation)

#### SPIN-EC (Energy Conservation)

#### SPIN-BC (Broadcast)

#### SPIN-RL (Request-Response)

### Data Gathering

#### Goal

Tradeoff

- Maximum lifetime
- Minimum latency
- Minimum energy consumption

#### Models

- Continuous collection: Data dikirim secara periodik
- Databased like network queries: Sink mengirim query ke node source
- Event notification: Source mengirim data saat sesuatu terjadi

#### Problems

Jika semua WSN mengirim data ke 1 sink (basestation). Data collection akan sangat lama dan data sangat banyak. Ini kenapa NB-IoT bukan solusi yang baik.  Solusinya adalah data aggregation.

### PEGASIS (Power Efficient Gathering for Sensor Information System)

Greedy algorithm

#### Cara kerja Chain Based Binary Pegasis

1. Hanya berkomunikasi dengan neighbor langsung
2. Setengah neighbor tidak lanjut komunikasi, setengah menyimpulkan dari 2 data
3. Repeat 1-2 sampai sisa 1 node
4. Kirim ke Base Station

#### 3 Level Chain Based

Grouping sensor jadi group (contoh 10 sensor 1 group), lakuin pegasis level kecil, lakuin pegasis level besar