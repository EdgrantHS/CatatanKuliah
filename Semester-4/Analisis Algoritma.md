# **Analisis Algoritma Before UTS**

# Week 1

## Others

- Silabus
- Ada tugas masalah
- BRP
- Big O (ada little o, omega dll)
- Materi UTS sampe Recursive algorithm
- Baca-baca dulu sebelum kuliah
- kelompok 3-4 orang

## Materi (Survei of algoritmic technique)

- Math Tools:
  - Summation (Deret, sigma)
  - Recurrence Relation (Fungsi Rekursif)

### Iterative Algo

- Loop Invariants (initialize == maintanence == termination)
- Greedy Algo (Setelah UTS)
- dynamic programign
- NP-completeness (masalah gak bisa diselesain di bentuk program)

# Week 3 (Foundation)

## Pseudocode

### Convention

- while, for, if-else
- // comment
- multiple asignment i=j=3
- block indicated by indents
- array[i]
- array passed by **reference**
- parameters passed by **value**
- can return multiple value

### Loop invariants

- initialization
- Maintenence
- Termination

## Fungsi analisis algoritma

### time analysis T(n): Running time

$T(n) = c_1n + c_2(n-1) + \Sigma + ...$
- insertion sort
    - best case : an + b (linear time)
    - worst case : $an^2 + bn + c$ (squared time)
- **merge sort:**
    - worst case : nlg(n)

### max input size

### size analysis

### complexity

## Function clasification

- konstan
- logaritmik
- polilogaritmik
- exponensial (a < 1)
- polinomial
- exponensial (a > 1)
- faktorial

# Week 4 (Asymptotic Colplexity)

- Only 1 term, the highest order

## Symbols

- $\Theta$ (theta) - tight bound
  - dibatasi atas dan bawah
  - $c_1g(n) \le f(n) \le c_2g(n)$
- $O$ (big O) - upper bound
- $\Omega$ (omega) - lower bound
  - $f(n) \ge c \cdot g(n)$
- $o$ (little o) - upper bound, not tight
- $\omega$ (little omega) - lower bound, not tight

In essence, big omega (Ω) gives us a threshold below which the function will not fall, while little omega (ω) describes a more aggressive growth where the function eventually surpasses any constant multiple of the comparison function.

## Tugas

$
\frac{n^2}{2} = \omega(n) \\
$

$
\forall c > 0 \\
\exist n_0 > n \\
\forall n \ge n_0 \\
\frac{n^2}{2} \ge cn
$

$
\frac{n^2}{2} \ge cn \\
\frac{n}{2} \ge c \\
n \ge 2c \\
$

$
f(n) = \frac{n^2}{2} \\
g(n) = n \\
f(n) = \omega(g(n)) \\
f(n) = c \cdot g(n)
$

$
f(n) = \frac{n^2}{2} \\
g(n) = n^2 \\
f(n) = \omega(g(n)) \\
f(n) = c \cdot g(n)
$


$
\frac{n^2}{2} \ge c \cdot n^2 \\
\frac{1}{2} \ge c \\
c \le \frac{1}{2}  \\
$
$\frac {n^2}{2} \ne \omega(n^2)$

$\lim_{n\to\infty} \frac{2n^3}{n} = \infty$

# Week 5 (sorting)

```c

while(i < n){
    i = i*2; // O(N) = Lg(N)
    i = i+1; // O(N) = N
}

while(i < n){
    while (j < n){
        j = j*2; // O(N) = Lg(N)
    }
    i = i+1 // O(N) = N
}

N*lg(N) + N = O(N*lg(N))

```

# Week 7 (Rekursi)

## Solusi cari asimtot

- Substitusi
- Recursion Tree
- Master Theorom


# **Analisis Algoritma After UTS**

## Review Data Structure (Week 1)

### Random

- Akan diminta membuat paper tentang NP-Hard Problems
- Pak daus akan kasih materi kuliah 1 jam, waktu sisanya bebas dipakai untuk kerjain tugas/tanya-tanya
- UAS Open ALL

### Peniaian

- Setiap pertemuan ada posttest ada 30 soal yang masuk penilaian 3%
- Ada paper 16%
- UAS 16%

### Array ADT

- Dalam memory berdampingan
- **Operasi :** display, add, append, isert, delete, search, dst...
- Tidak bisa resize

### Linked List

- Array dengan elemen tidak berdampingan
- Setiap node ada alamat elemen selanjutnya
- **Operasi :** display, add, append, isert, delete, search, dst...
- Bisa resize

### Stack

- Saking EZ-nya gak ditulis

### Queue

- Saking EZ-nya gak ditulis

### Priority Queue

- Saat dequeue, elemen yang priority paling tinggi yang didequeue duluan
- Akan dibahas lebih dalam nanti

## Tree (Week 1)

### Review

- Node
- Edge
- Root
- Children
- Parent
- Sibling
- Subtree

### Height

- Node Height: Jumlah path root ke node tersebut
- Tree Height: Jumlah path root ke leaf terjauh

## Binary Tree (Week 1)

- 1 Node maksimal 2 child

### Catalan Number

- Rumus mencari jumlah binary tree yang mungkin dibentuk dengan n buah node

$$T(n) = \frac{C_{n}^{2n}}{n+1}$$

Number of trees with maximum height: $2^{n-1}$

#### Optimasi

- Rumus combitanorial sangat memakan waktu, cara lain adalah menggunakan dynamic programing

$$T(n) = \Sigma_{0}^{T-n} T(n)*T(n-1)$$

> butuh dicek, gak yakin benar

### Representasi

- Mengugnakan Array: setiap node dikaitkan ke elemen array
  - Kekurangan: bentuk tree fixed
- Linked List: node mempunyai 2 pointer untuk `Left Child` dan `Right Child`

### Navigasi

- Preorder (depth first search)
- Inoreder
- Postorder (breadth first search)
- level

