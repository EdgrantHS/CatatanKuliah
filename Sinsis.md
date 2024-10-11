# Sinsis Pre-UTS

## Introduction (Week 1)

Silabus: (./BPKM 2020 - online - Teori Sinyal Analisis Sistem.pdf)

## Signal Introduction (Week 1)

### Classifications of Signals

#### Continuous and Discrete

- Continuos: Continuos array of continuous values
- Discrete: Discrete array of continuous values (Sampled)
  - Frequency: n/s
  - Nyquist Theorem: $f > 2f_{max}$
  - > Perkembangan: Compressed Sensing

#### Even and Odd

- Even: $x(t) = x(-t)$: Symetrical on y-axis
- Odd: $x(t) = -x(-t)$: Symetrical on x-axis (with regard to origin)

![Even and Odd](./images/1_even_odd.jpg)

#### Periodic and Aperiodic

- Periodic: $x(t) = x(t + T)$
- Aperiodic: Not periodic

### Decomposition:

- $x(t) = x_{even}(t) + x_{odd}(t)$
- $x_{even}(t) = \frac{1}{2} [x(t) + x(-t)]$
- $x_{odd}(t) = \frac{1}{2} [x(t) - x(-t)]$

![decomposition](./images/1_decomposition.jpg)

### Conjugate Symmetric

conjugate symmetric: $x(t) = x^{*}(-t)$

> x(t) = x(-t) for imaginary part

let $x(t) = x_{r}(t) + jx_{i}(t)$

- $x_{r}(t) = x_{r}(-t)$
- $x_{i}(t) = -x_{i}(-t)$

> !INI REVIEW LAGI

### Operasi Dasar

- Amplitude Scaling:
  - $y(t) = ax(t)$
- Addition
  - $y(t) = x(t) + x_{1}(t)$
- Multiplication (Convolution)
  - $y(t) = x(t)x_{1}(t)$
- Differentiation (Inductor)
  - $y(t) = \frac{dx(t)}{dt}$
  - Signal dipercepat
- Integration (Capacitor)
  - $y(t) = \int x(t)dt$
  - Signal diperlambat
- Time Scaling
  - $y(t) = x(at)$
  - Scaled from origin
- Discrete Time Scaling
  - $y[n] = x[kn], k \in Z$
  - Some value is skipped
- Refelction
  - $y(t) = x(-t)$
- Time shifting
  - $y(t) = x(t - t_{0})$ (Right shift sebanyak $t_{0}$)
  - $y[n] = x[n - n_{0}]$ (Right shift sebanyak $n_{0}$)

### Precedence of Operation

$y(t) = x(at + b)$

1. Time Shifting ($v(t) = x(t + b)$)
2. Time Scaling ($y(t) = v(at)$)

### Elementary Signals

#### Exponential Decay/Growth

- $x(t) = Ce^{at}$
- Using resistor and capacitor/inductor
- Capacitor
  - $RC\frac{dv(t)}{dt} + v(t) = V_{0}$
  - $v(t) = V_{0}e^{-\frac{t}{RC}}$

#### Sinusoidal Signals

- $x(t) = A\cos(\omega t + \phi)$
- $T = \frac{2\pi}{\omega}$

Discrete:

- $x[n] = Acos(\Omega n + \phi)$
- $\Omega = \frac{2\pi m}{N}$
- m = faktor untuk pastiin rumusnya bilangan bulat
- N = T
- n = t

#### Complex Exponential Signals

- $x(t) = Ae^{j\omega t}$
- x = real, y = imajiner

#### Damped Sinusoidal Signals

- $x(t) = Ae^{-\alpha t}\cos(\omega t + \phi)$

## Systems (Week 2)

### Primitive Signals

#### Step function

- $x(t) = u(t)$

#### Square Function

- $x(t) = u(t-a) - u(t-b)$
- dari a ke b 1

#### Impulse function

- $x(t) = \delta(t)$
- $\int_{-\infty}^{\infty} \delta(t)dt = 1$
- impulse adalah turunan dari step function
  - $\delta(t) = \frac{du(t)}{dt}$

#### Ramp function

- $x(t) = tu(t)$

### System

#### Stability

- Bounded input, bounded output (BIBO)
- $|x(t)| \le M_{x} < \infty$
- $|y(t)| \le M_{y} < \infty$
- Ada batasan atas dan bawah

#### Memory

- Memoryless: (Resistor) $i(t) = \frac{1}{R}v(t)$
  - Hanya perlu nilai v saat ini
- Infinite Memory: (Capacitor) $i(t) = C\frac{dv(t)}{dt}$
  - Perlu nilai v sebelumnya

#### Causality

- Causal: Output hanya bergantung pada input sebelumnya (tidak ada masa depan)
  - $y[n] = \frac{1}{2}x[n] + x[n-1]$
  - contoh: streaming
- Non-causal: Output bergantung pada masa depan
  - $y[n] = x[n+1] + x[n]$
  - contoh: video youtube

#### Invertibility

- Invertible: Ada fungsi yang bisa mengembalikan input dari output
- Non-invertible: Tidak ada fungsi yang bisa mengembalikan input dari output

#### Linearity

- Superposition: $y(x_1 + x_2) = y(x_1) + y(x_2)$
- Homogeneity: $y(ax) = ay(x)$

> PR: Dekomposisi komponen genap dan ganjil | Cek signal apakah periodik

## Discrete Time System (Week 3)

### Cara mereprentasi

- Verbal description
- Difference equation $y[n] = x[n] - x[n-1]$
- Block diagram

#### Block diagram

![block diagram](./images/BlockDiagram.png)

Kalau pengurangan, tetap pakai adder tetapi ada buffer negatif di salah satu input

### Operator Notation

$Y = X - RX = (1-R)X$

> Y = output, X = input, R = delay

$H = 1 - R = \frac{Y}{X}$

> H = Transfer Function

#### Operator Algebra for Cascading System

$Y_2 = H_2Y_1 = H_2H_1X = (1-R)(1-R)X$
$Y_2 = (1-2R+R^2)X$

<br>

$y_2[n] = y_1[n] - y_1[n-1] = (x[n] - x[n-1]) - (x[n-1] - x[n-2])$
$y_2[n] = x[n] - 2x[n-1] + x[n-2]$

#### Rekursif

$Y = \frac{X}{1-P_0R}$ setara dengan  
$y(n) = x(n) + P_0y(n-1)$

$Y = \frac{P_0 X}{1-P_1R-P_2R^2}$ setara dengan  
$y(n) = P_0x(n) + P_1y(n-1) + P_2y(n-2)$

## Second Order System (Week 4)

### Faktorisasi Cascading System

- $Y = X + 1.6RY - 0.6^2Y$
- $X = (1 - 1.6R + 0.63R^2)Y$
- $X = (1 - 0.6R)(1 - 0.9R)Y$

### Accumulator

- $Y = \frac{1}{(1-aR)(1-bR)}X$
- $Y = (1 + aR + a^2R^2 + ...)(1 + bR + b^2R^2 + ...)X$
- $Y = 1 + (a+b)R + (a^2 + ab + b^2)R^2 + (a^3 + a^2b + ab^2 + b^3)R^3$

> Contoh mencari $Y[2]$, jadinya mencari $(a^2 + ab + b^2)R^2$, memasukkan a dan b ke rumus.

### Partial Fraction

- $Y/X = \frac{1}{(1 - 0.6R)(1 - 0.9R)}$
- $Y/X = \frac{A(1 - 0.9R) + B(1 - 0.6R)}{(1 - 0.6R)(1 - 0.9R)}$
- $\frac{A(1 - 0.9R) + B(1 - 0.6R)}{(1 - 0.6R)(1 - 0.9R)} = \frac{1}{(1 - 0.6R)(1 - 0.9R)}$
- $A(1 - 0.9R) + B(1 - 0.6R) = 1$
- $(A+B) - (0.9A + 0.6B)R = 1 + 0R$
- $A = 4.5, B = -3.5$
- $Y/X = \frac{4.5}{1 - 0.9R} - \frac{3.5}{1 - 0.6R}$

> Sistem yang berfeedback memiliki banyak (4) represenatasi dengan hasil yang sama

#### Lanjutan

- $H = \frac{1}{1-P_0 R}$
- $H = \Sigma P_0^n R^n$
- $y[n] = P_0^n$

---

- $Y/X = \frac{4.5}{1 - 0.9R} - \frac{3.5}{1 - 0.6R}$
- $$Y = 4.5(0.9^n) - 3.5(0.6^n)$$

> Ini salah kayaknya, harusnya ubah ke z transform dulu (- ED week 6)

To Do:

1. Dekoposisi partial fraction
2. Mengubah partial fraction menjadi bentuk tanpa R

### Z Transform

- $X(z) = \Sigma x[n]z^{-n}$
- $X(z) = \frac{z}{z-1}$
- $R = z^{-1}$

#### Contoh tadi

- $Y/X = \frac{1}{(1 - 0.6R)(1 - 0.9R)}$
- $Y/X = \frac{1}{1-1.6R + 0.63R^2}$
- $Y/X = \frac{1}{1 - 1.6z^{-1} + 0.63z^{-2}}$
- $Y/X = \frac{z^2}{z^2 - 1.6z + 0.63}$
- $Y/X = \frac{z^2}{(z - 0.9)(z - 0.7)}$
- $Y/X = \frac{A}{z - 0.9} + \frac{B}{z - 0.7}$
- $A = 4.5, B = -3.5$
- $Y/X = \frac{4.5}{z - 0.9} - \frac{3.5}{z - 0.7}$
- $Y = 4.5(0.9^n) - 3.5(0.7^n)$

#### Contoh lain

- $y[n] = -1/4y[n-1] + 1/8y[n-2] + x[n-1] - 1/2x[n-2]$
- $Y = -1/4RY + 1/8R^2Y + RX - 1/2R^2X$
- $Y = (1 - 1/4R + 1/8R^2)Y + (1 - 1/2R^2)X$
- $Y/X = \frac{R(1 - 1/2R^2)}{(1 + 1/2R)(1 -1/4R)}$
- $Y/X = \frac{z^{-1}(1 - 1/2z^{-1})}{(1 + 1/2z^{-1})(1 - 1/4z^{-1})}$
- $Y/X = \frac{z - 1/2}{(z + 1/2)(z - 1/4)}$
- Poles: -1/2, 1/4

## Continuous time system (Week 5)

- Delay menggunakan integrator

> $\delta'(t) = u(t)$ Turunan impulse = step  
> $u'(t) = \delta(t)$ Turunan step = impulse

- Integrator bertindak sebagai accumulator (tanki)

### Operator Representation

- R berubah menjadi A
- $Y = X + AX$ ekuivalen dengan
- $y(t) = \int_{-\infty}^{t}(x(t)+py(t))d\tau$ ekuivalen dengan
- $y'(t) = x(t)+py(t)$ ekuivalen dengan
- $y(t) = \int_{-\infty}^{t}x(\tau)d\tau$ ekuivalen dengan

#### Contoh 1

- $Y = pA(X + Y)$
- $y(t) = p\int(x(t) + y(t))dt$
- $y'(t) = px(t) + py(t)$

#### Contoh 2

- $Y = A(X + pY)$
- $y(t) = \int(x(t) + py(t))dt$
- $y'(t) = x(t) + py(t)$

## Z-Transform (Week 6)

- $H(R) = \frac{1}{1-R-R^2}$

### Transformasi Accumulator

- $H(R) = 1 + R + 2R^2 + 3R^3 + 5R^4 + ...$
- didapat dengan long division $1$ dengan $(1-R-R^2)$

### Transformasi Z

- $H(R) = 1 + R + 2R^2 + 3R^3 + 5R^4 + ...$
- $H(R) = \sum_n h[n]R^n$
- $H(z) = \sum_n h[n]z^{-n}$

> Bilateral Z-Transform (dari $-\infty$ sampai $\infty$)

### Contoh Unit Impulse

- $x[n] = \delta[n]$
- $X(z) = \sum_{n=-\infty}^{\infty}\delta[n]z^{-n}$
- $X(z) = 1$

### Shifting Transformation

- $x[n]= X[z]$
- $x[n-1] = z^{-1}X(z)$
- $x[n-k] = z^{-k}X(z)$

### Rational Polynomial

- $b_0y[n] + b_1y[n-1] + ... = a_0x[n] + a_1x[n-1] + ...$
- $Y(z) = \frac{b_0 + b_1z^{-1} + ...}{a_0 + a_1z^{-1} + ...}X(z)$
- $H(z) = \frac{Y(z)}{X(z)} = \frac{b_0 + b_1z^{-1} + ...}{a_0 + a_1z^{-1} + ...}$

#### Zero-Pole

- $H(z) = \frac{Y(z)}{X(z)} = \frac{b_0 + b_1z^{-1} + ...}{a_0 + a_1z^{-1} + ...}$
- $H(z) = \frac{Y(z)}{X(z)} = \frac{(1 - 0.9z^{-1})(1 - 0.7z^{-1})}{(1 - 0.6z^{-1})(1 - 0.8z^{-1})}$

> Zero: 0.9, 0.7  
> Pole: 0.6, 0.8

#### Poles to Polinomial

- $H(R) = \frac{k}{1 - aR}$
- $H(z) = \frac{k}{1 - az^{-1}}$
- $H(z) = \frac{kz}{z - a}$
- $y[n] = k(a^n)x[n]$

$|Z| \le P_0$

> Sifat Z-transform

#### Kalau $|Z| \ge P_0$

- $H(z) = \frac{z}{z-a}$
- $y[n + 1] - a^{-1}y[n] = x[n + 1]$
- $y[n] = a^{-1}y[n + 1] + x[n + 1]$

Dicoba masukinsatu satu mencari y[n]

Didapat $y[n] = -a^n u[-n-1]$

- $y[n \ge 0] = 0$
- $y[-1] = -(a)^{-1}$
- $y[-2] = -(a)^{-2}$
- $y[-3] = -(a)^{-3}$

> Unit circle = 1, kalau Region of Convergence (ROC) di luar unit circle, maka z > 1, dan juga kebalikannya
