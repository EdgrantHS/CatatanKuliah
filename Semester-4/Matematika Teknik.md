# **Matematika Teknik**

Link Emas: `https://emas2.ui.ac.id/course/view.php?id=61149`

# Week 1a (Sequence)

## Basic Definition

- a1 - first term (a sub 1)
- an - nth term (a sub n)
- Notation: {a1,a2,a3,...,an}

## Others

- minimal 5 term kalau diminta buat soal
- Tugas submit SS deadline jumat

## Convergenge

- utk sequence (barisan) konvergen, limitnya adalah 0

## Squeeze theorem

### lim(abs(an)) = 0 -> lim(an) = 0

- proof:
  - abs(an) <= abs(bn) <= abs(cn)
  - lim(-an) = 0
  - lim(cn) = 0
  - lim(-an) <= lim(an) <= lim(cn)
  - 0 <= lim(an) <= 0
  - lim(an) = 0

### konvergensi ratio sequence (r^n)

- |r| < 1 -> konvergen
- |r| >= 1 -> divergen

### Konvergensi

- lim(an) = L, lim(a2n) = L, lim(a2n+1) = L
- konvergen

## Terminologi

- incriesing, decreasing, monotonic
- bounded below, above (ada batasan yg gak mungkin dilewati)

# Week 1b (Series)

## Konvergensi

- partial sum
  - konvergen -> limit partial sum = S
  - divergen -> limit partial sum = infinity

## Sifat

- Series(a) * Series(b) != Series(a\*b)
- Series(a) * Series(b) = Series(series(a(i),b(n-i)))
- If series converge, the sequence lim to 0. Else series diverge

## Index shift

- change of variable
- n = m + k
- k = n - m
- k = 0 -> n = m
- pastikan semua term di keduanya sama

## Geometric Series

- a + ar + ar^2 + ... + ar^n
- S = a(1-r^n)/(1-r)

## Telescoping Series

- a1 - a2 + a2 - a3 + a3 - a4 + ... + an - an+1
- S = a1 - an+1
- other example: S 1/((n+2)(n+1))
- S = 1/(n+2) - 1/(n+1)

## others

- close range and open range
  - close range: [a,b]
  - open range: (a,b)
  - mix: [a, inf)

## p teries test

- Series(1/n^p)
- if p > 1 -> divergen
- if p <= 1 -> konvergen

## Comparison test

## Limit Comparison test

- if lim(a(n)/b(n)) = c
  - if c >= 0 -> both converge or diverge
  - if c = inf -> both diverge

## Alternating Series

- (-1)^(n-1) * an
- lim(an) = 0
- decresing -> konvergen
- kondisi tidak satisfied -> belum tentu divergen

## Absolute Convergence

- if series |an| konvergen -> series an konvergen
- if series an konvergen, series |an| divergen -> conditional convergence

## Ratio Test

- lim |a(n+1)/an| = L
- if L < 1 -> konvergen
- if L > 1 -> divergen
- if L = 1 -> inconclusive
- usefull for factorial

## Root Test

- lim |a(n)|^(1/n) = L
- if L < 1 -> konvergen
- if L > 1 -> divergen
- if L = 1 -> inconclusive

# Week 2a (Differential Calculus)

## First Order ODE (Ordinary Differential Equation)

- **Implicit Form**: F(x,y,y') = 0
- **Explicit Form**: y' = f(x,y)  

![Explisit and implisit](https://media.geeksforgeeks.org/wp-content/uploads/20230510161047/Explicit-and-Implicit-Differentiation.webp)

## Directional Field

![directional field](https://tutorial.math.lamar.edu/classes/de/DirectionFields_Files/image003.png)

## ODE

- kalau general solution masih ada c
- kalau dikasih initial condition, bisa dicari c

### Linear

- persamaan y dan x relasi linear: y = mx + c

### Non Linear

- persamaan y dan x relasi perkalian: yx = c
!LEARN ODE

### Valid interval

- interval dimana solusi valid
- **contoh**:
  - kalau logn/ln, isinya > 0
  - kalau penyebuit, tidak boleh 0
  - dapet breaking point terus cari sisi mana yg valid, dengan cari initial value di sisi mana

### exact ODE

- menggunakan partial derivative
- menggunakan psi sebagai fungsi perantara

### Bernoulli ODE

- y' + p(x)y = q(x)y^n
- muinggunakan variabel lain untuk mengubah bentuk persamaan
- z = y^(1-n)

# Week 2b (Taylor Series)

- f(x) = f(a) + f'(a)(x-a) + f''(a)(x-a)^2/2! + f'''(a)(x-a)^3/3! + ...
- maclauren series adalah taylor series dengan a = 0

# Week 3a (Second Order Homogenus)

- **Contoh**: $y^{''} - 9y = 0$
  - Solusi = $e^{-3t}\ ||\ e{^3t}$
  - Solusi general = $c_1 \cdot e^{3t} + c_2 \cdot e^{-3t}$

## Formal proof

- assume ada persamaan second order $ay^{''} + by^{'} + cy = 0$
- assume bentuk solusinya $y(t) = e^{rt}$
- yutinin y(t)
- substitusi ke atas
- cari yg solusinya 0
- $e^{rt} \cdot (ar^2 + br + c)$

### Kemungkinan solusi

1. dua duanya angka  real dan beda
2. akarnya kompleks
3. akarnya kembar $r_1 = r_2$

### Contoh

- $y^{''} - 9y = 0$
- $r^2 - 9 = 0$
- $r = \pm 3$
- solusi = $e^{\pm3t}$
- 2 real and distinc solution
- bisa digabung $c_1 \cdot e^{3t} + c_2 \cdot e^{-3t}$

## Complex Root

- $r = \lambda +- \mu i$
- rumus euler $e^{i\theta} = cos(\theta) + i sin(\theta)$
- solusi generic kalau dijumlahin beberapa solusi, dibagi, atau yang lain tetap solusi
- Dapet solution = $a +bi$
- **general solustion**: $c_1 \cdot e^{at} \cdot cos({bt}) + c_2 \cdot e^{at} \cdot sin({bt})$

## Repeated Roots

- D = 0
- **general solution**: $c_1 \cdot e^{rt} + c_2 \cdot t \cdot e^{rt}$

# Week 3b

## Population modeling

- rate change p(t) = rate enter - rate exit
$$p'(t) = p'(in) - p'(out)$$
- aplikasi ode
- dengan kriteria awal ini (birth rate, death rate)
 	- apakah populasi survive
 	- kapan akan sampai 0
 	- kalaau ingin 1 bulan sampai 0 harus tambah apa

### Contoh

	- population proposional 
$p(t+1) = r \cdot p(t)$
$P = (rP +15) - (20+10)$
$P = rP -15$
$P(10) = 100$
find sollution
$c = 100$
$exp(14r)$

# Week 4a

## Euler-Cauchy Equation

![blackpenredpen](https://media.discordapp.net/attachments/1168511160807604234/1211873475522854952/image.png?ex=65efc820&is=65dd5320&hm=d12def9193152cfd61dbce86fe078450446b15dc0c81b26e34c8d9b0c54c0097)

## Linier Non Homogen

- $y'' + p(t)y' + q(t)y = f(x)$
- $f(x) \ne 0$
- Assume solusi homogenus (... = 0) $Y_1(t) - Y_2(t)$
- complementary solution:
$$y_c = c_1y_1(t) - c_2y_2(t)$$
- solusi = $Y_1(t) - Y_2(t) = y_c$
- particular solution (cari angka yang bisa dimasukan dam benar)
  - tebakan yang mungkin adalah $Y_p(t) = A exp(...)$
  - tebakan mungkin juga $Y_p(t) = A sin(...) + B Cos(...)$
  - mungkin polinomial (kalau polinomial)
  - untuk gabungan perkalian seperti $f(x) = t \cdot exp(...)$, $Y_p(t)$, jadinya $C\ exp(...)(At + B)$
$$y(t) = y_c(t)+Y_p(t)$$
- y(c) complementary solution
- $y_c = c_1y_1(t) + c_2y_2(t)$
- rules of particular sum
  - $Y_{p1}(t)$ solustion of $f_1(t)$
  - $Y_{p2}(t)$ solustion of $f_2(t)$
  - $f_{p1}(t) + f_{p2}(t)= Y_{p1}(t) + Y_{p2}(t)$
- kalau di $Y_p(t)$ ada $Y_c(t)$, maka $Y_p(t)$ harus diubah
  - $Y_p(t) = t \cdot A \cdot exp(...)$

### Generic Particular

$$Y_p(t) = -y_1 \int\frac{y_2\cdot g(t)}{W(y_1, y_2)}dt +  y_2 \int\frac{y_1\cdot g(t)}{W(y_1, y_2)}dt $$
W = Wronskian = $\begin{vmatrix} y_1 & y_2 \\\ y_1' & y_2' \end{vmatrix}$

# Week 4b (Mechanical Vibration Spring)

- Bergerak ke bawah positif, ke atas negatif
- $F = -kx$
- Damper

![acting forces](https://media.discordapp.net/attachments/899537507409072140/1212960433120747530/image.png?ex=65f3bc6e&is=65e1476e&hm=324f1155f8f1202787fa1c1e8aa076f9b6971d3118efd1d670885d72a407ccd4&=&format=webp&quality=lossless&width=782&height=677)
$F_g + F_s + F_d + F(t) = ma$  
$ma = mu''$
$mg - k(L + u) - \gamma u' + F(t) = mu''$  
$$mu'' + \gamma u' + k(L + u) = mg + F(t)$$

- $u$ = displacement
- $L$ = natural length
- $k$ = spring constant

## At rest

$mu'' + \gamma u' + ku = F(t)$  

## No external force

when $F(t) = 0$, $u'' + \gamma u' + ku = 0$ (fre undamped vibration)

## Free undamped vibration

$\gamma = 0$, $u'' + ku = 0$
$$mu'' + ku = 0$$
Roots:

- $r^2 + \frac{k}{m} = 0$
- $r = \pm i\sqrt{\frac{k}{m}}$
- $r = \pm i\omega_o$
- $\omega_o = \sqrt{\frac{k}{m}}$ (natural frequency)
Solution:
$$u(t) = c_1cos(\omega_ot) + c_2sin(\omega_ot)$$
(phasor form)
$$u(t) = Acos(\omega_ot + \phi)$$

### Example

Diketahui  

- $m = 5$
- $L = 0.6125$
- $F(t) = 0$
- $u = -0.2$
- $u' = 0.4$

Ditanya

- $u(t)$

**Jawab:**
Determine equation  
$$mu'' + ku = 0$$  

Belum ada k, jadi perlu dicari  

- $F_g = F_s$  
- $mg = k(L)$  
- $k = \frac{mg}{L}$
- $k = \frac{5 \cdot 9.8}{0.6125} = 80$  

IVP bisa ditlus  

- $5u'' + 80u = 0$

Mencari general solution

- $r^2 + \frac{80}{5} = 0$]
- $r = \pm 4i$
- $u(t) = c_1cos(4t) + c_2sin(4t)$
- $u'(t) = -4c_1sin(4t) + 4c_2cos(4t)$

Masukkan Initial Condition

- $u(0) = -0.2$
- $u'(0) = 0.4$
- $c_1 = -0.2$
- $c_2 = 0$

Maka solusinya

- $u(t) = -0.2cos(4t)$

## Damped Vibration

$$mu'' + \gamma u' + ku = 0$$
$$r = \frac{-\gamma \pm \sqrt{\gamma^2 - 4mk}}{2m}$$

### Kasus

- $D > 0$ -> over damped
  - $u(t) = c_1e^{r_1t} + c_2e^{r_2t}$
- $D = 0$ -> critically damped
  - $u(t) = c_1e^{rt} + c_2te^{rt}$
![over damped](https://cdn.discordapp.com/attachments/899537507409072140/1212966980693524500/image.png?ex=65f3c288&is=65e14d88&hm=0e458a587e1237c3e1ed0a909cdd6f70d2805b371b3ea65dab5a394a8ec0b11a&)
- $D < 0$ -> under damped
![rumus under damped](https://cdn.discordapp.com/attachments/899537507409072140/1212967341839749150/image.png?ex=65f3c2de&is=65e14dde&hm=faf7ebc5b386f89df49b7b6c7e044eb1c5d27390900aed82e6534b99964aface&)

## Forced Vibration

$$mu'' + \gamma u' + ku = F(t)$$

- Non homogen

# !TUGAS

- plot grafik akselerasi dan kecepatan
- coba persamaan di emas

# Week 5a (Laplace Transform)

- pindah ke domain yang beda, domain lapalace adalah domain s (complex number)

## Definisi

$$L(f(t)) = F(s)$$
$$L(f(t)) = \int_0^\infty e^{-st}f(t)dt$$

## Piecewise

- piecewise continuous adalah fungsi continuous dengan jumlah titik yang terbatas
  - fungsinya putus putus

## Contoh 1

- $\int_0^\infty e^{ct}dt$  

Converrt to limit  

- $\lim_{a \to \infty} \int_0^a e^{ct}dt$
Evaluete the eexpreton
- $\lim_{a \to \infty} \frac{e^{ct}}{c} \Big|_0^a$
- $\lim_{a \to \infty} \frac{e^{ca}}{c} - \frac{e^{c0}}{c}$
- $\lim_{a \to \infty} \frac{e^{ca}}{c} - \frac{1}{c}$  

Kesimpulan  

- $\frac{1}{c}$ kalau $c < 0$
- $\infty$ kalau $c > 1$

## Contoh 2

- $f(t) = 1$
- $L(1) = \int_0^\infty e^{-st} dt$
- $-s < 0$
- $L(1) = -\frac{1}{s}$

## Contoh 3

- $f(t) = e^{at}$
- $L\{e^{at}\} = \int_0^\infty e^{-st}\cdot e^{at} dt$
- $L\{e^{at}\} = \int_0^\infty e^{(a-s)t}dt$
- $c = (a-s)t$
- $-\frac{1}  {c}$
- $L\{e^{at}\} = \frac{1}{s-a}$
- $s > a$

## Properties

### Linearity

- $L\{af(t) + bg(t)\} = aL\{f(t)\} + bL\{g(t)\}$

### Shifting

- $L\{e^{at}f(t)\} = F(s-a)$
- $e^{at}f(t)\ = L^{-1}\{F(s-a)\}$

## Inverse Laplace

- $L^{-1}\{F(s)\} = f(t)$

### Formal Definition

- $L^{-1}\{F(s)\} = \frac{1}{2\pi i} \int_{\gamma - i\infty}^{\gamma + i\infty} e^{st}F(s)ds$

### Laplace transform table

- $L\{t^n\} = \frac{n!}{s^{n+1}}$
- $L\{e^{at}\} = \frac{1}{s-a}$
- $L\{sin(at)\} = \frac{a}{s^2 + a^2}$
- $L\{cos(at)\} = \frac{s}{s^2 + a^2}$
- $L\{sinh(at)\} = \frac{a}{s^2 - a^2}$
- $L\{cosh(at)\} = \frac{s}{s^2 - a^2}$

# **Matematika Teknik** (After UTS)

## Fourier Introduction (Week 1)

### Random

- UAS open book fisik, harus diprint
- boleh kalkulator
- belajar fourier dan Z-Transform

### Fourier Introduction

- warna suara gitar dan piano beda
- karena overtonenya beda
- overtone itu bisa dipisah menjadi banyak fungsi sinosoida murni
- **Fourier Transform mengubah time function ke spectral function**

## Fourier Analysis. Partial Differential Equation (Week 1)

Sebuah Fungsi periodic apapun dapat dipisah menjadi:

$$a_0 + a_1 cos\ x + b_1 sin\ x + a_2 cos\ 2x + b_2 sin\ 2x + ...$$
$$a_0 + \Sigma^{\infty}_{n=1} (a_n cos\ nx + b_n sin\ nx)$$  
$a_0$ = dc bias

### Mencari $a_0$, $a_n$, $b_n$

- $a_0 = \frac{1}{2 \pi}\int_{- \pi}^{\pi} f(x) dx$
  - $a_0$ = rata rata dari fungsi

- $a_n = \frac{1}{2 \pi}\int_{- \pi}^{\pi} f(x) cos\ nx dx$

- $b_n = \frac{1}{2 \pi}\int_{- \pi}^{\pi} f(x) sin\ nx dx$

### Periodic Regtangular Wave

- $a_0 = \frac{1}{2\pi}\int_{- \pi}^{\pi} f(x) dx$

- $a_n = \frac{1}{\pi}\int_{- \pi}^{\pi} f(x) cos\ nx dx$
  
- $= [\int^{0}_{- \pi} (-k) cos\ nx\ dx + \int^{\pi}_{0} (k) cos\ nx\ dx$
  
- $= 0$

------------

- $b_n = \frac{1}{\pi}\int_{- \pi}^{\pi} f(x) sin\ nx dx$
  
- $= [\int^{0}_{- \pi} (-k) sin\ nx\ dx + \int^{\pi}_{0} (k) sin\ nx\ dx$
  
- $\frac{1}{\pi} [k \frac{cos\ nx}{n}|^{0}_{- \pi} - k \frac{cos\ nx}{n}|^{\pi}_{0}]$

## Real Parameter, Real Dimension (Week 2)

### Radian to Dimension Conversion

- Radian = $\nu$

- $\nu = 2 \pi$

- $$\nu = \frac{\pi}{L}x$$ Koefisien penyama

- $$L = \frac{1}{2}\ Periode$$

- $$a_0 = \frac{1}{L}\int^{L}_{-L} f(x) dx$$
- $$a_n = \frac{1}{L}\int^{L}_{-L} f(x) cos\ \frac{n \pi}{L}x dx$$
- $$b_n = \frac{1}{L}\int^{L}_{-L} f(x) sin\ \frac{n \pi}{L}x dx$$

## Even Edd Function (Week 2)

### Even Function

- Komponeen sin = 0
- Rumusanya menjadi
- $$f(x) = a_0 + \Sigma^{\infty}_{n=1} a_n cos\ nx$$
- $$a_0 = \frac{1}{\pi}\int^{\pi}_{-\pi} f(x) dx$$
- $$a_n = \frac{1}{\pi}\int^{\pi}_{-\pi} f(x) cos\ nx dx$$
- $$a_n = \frac{1}{L}\int^{L}_{-L} f(x) cos\ \frac{n \pi}{L}x dx$$

### Odd Function

- Komponeen cos = 0
- Tidak ada $a_0$
- Rumusanya menjadi
- $$f(x) = \Sigma^{\infty}_{n=1} b_n sin\ nx$$
- $$b_n = \frac{1}{\pi}\int^{\pi}_{-\pi} f(x) sin\ nx dx$$
- $$b_n = \frac{1}{L}\int^{L}_{-L} f(x) sin\ \frac{n \pi}{L}x dx$$

## Complex Fourier Series (Week 2)

### Trigonometric Definition

- $f(x) = a_0 + \Sigma^{\infty}_{n=1} (a_n cos\ nx + b_n sin\ nx)$

Konversi sin cos ke sin

- $A\ cos\ nx + B\ sin\ nx = C\ sin\ (nx + \phi)$
- $C = \sqrt{A^2 + B^2}$
- $\phi = tan^{-1}(\frac{B}{A})$

Rumus fourier

- $f(x) = \Sigma^{\infty}_{n=1} C_n sin\ (nx + \phi_n)$

### Complex Definition

- $f(x) = \Sigma^{\infty}_{n=1} c_n e^{inx} + k_n e^{-inx}$

- $c_n = \frac{1}{2} (a_n - ib_n) = \frac{1}{2\pi} \int^\pi_{-\pi} f(x)e^{-inx}$

- $k_n = \frac{1}{2} (a_n + ib_n) = \frac{1}{2\pi} \int^\pi_{-\pi} f(x)e^{inx}$

Dimensi lain

- $c_n = \frac{1}{2\pi} \int^L_{-L} f(x)e^{-i\frac{n\pi}{L}x}$

- $k_n = \frac{1}{2\pi} \int^L_{-L} f(x)e^{i\frac{n\pi}{L}x}$

- $f(x) = \Sigma^{\infty}_{n=1} c_n e^{i\frac{n\pi}{L}x} + k_n e^{-i\frac{n\pi}{L}x}$

## Non Periodic Function (Week 3)

- Square wave akan membentuk fourier series `SINC`
- `SINC` = $\frac{sin\ x}{x}$
- Semakin jauh pulse square wave, semakin kecil delta x-nya
- Jadi semakin banyak poin yang diambil dalam 1 waktu
- Jika hanya 1 pulse, delta x-nya menuju 0, jadi SINC continuous

$f_L(x) = a_0 + \Sigma^{\infty}_{n=1} (a_n cos\ \frac{n\pi}{L}x + b_n sin\ \frac{n\pi}{L}x)$

Semakin besar L, semakin kecil x berpengaruh terhadap cos.

### Fourier Integral

- $f(x) = \int^{\infty}_{-\infty} F(\omega) e^{i\omega x} d\omega$

- $\omega = \frac{n\pi}{L}$

- $F(\omega) = \frac{1}{\pi} \int^L_{-L} f(x) e^{-i\omega x} dx$

#### Even Function of Fourier Integral

- $A(\omega) = \frac{2}{\pi} \int^\infty_{0} f(x) cos\ \omega x\ dx$

- $f(x) = \int^\infty_{-\infty} A(\omega) cos\ \omega x\ d\omega$

#### Odd Function of Fourier Integral

- $B(\omega) = \frac{2}{\pi} \int^\infty_{0} f(x) sin\ \omega x\ dx$

- $f(x) = \int^\infty_{-\infty} B(\omega) sin\ \omega x\ d\omega$

### Fourier Cosine Transform

Even function half range extension

- $F_c(\omega) = \int^\infty_{-\infty} f(x) cos\ \omega x\ dx$

### Fourier Sine Transform

Odd function half range extension

- $F_s(\omega) = \int^\infty_{-\infty} f(x) sin\ \omega x\ dx$

### Cosine Transofrom of Exponential Function

- $f(x) = e^{-x}$
- $F(\omega) = \sqrt{\frac{2}{\pi}} \int^\infty_{-\infty} e^{-x} cos\ \omega x\ dx$
- $F(\omega) = \sqrt{\frac{2}{\pi}}\ \frac{1}{1 + \omega^2}$

### Sifat

- Linearity
  - $\alpha f(x) + \beta g(x) \rightarrow \alpha F(\omega) + \beta G(\omega)$
- Time Shifting
  - $f(x - x_0) \rightarrow e^{-i\omega x_0} F(\omega)$
- Frequency Shifting
  - $e^{i\omega_0 x} f(x) \rightarrow F(\omega - \omega_0)$

### Differential Equation Fourier Transform

- $F_c\{f''(x)\} = w^2 F_c\{f(x)\} - wf(0) - f'(0)$

### PR

- Deadline jumat minggu depan
- nama: NPM_Nama_[03/04]
