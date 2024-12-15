# Sinsis Pre-UAS

## Laplace Transform (Week 1)

> Mengapa perlu belajar transformasi: Mempermudah penyelesaian persamaan dengan domain waktu

$s = \alpha + j\omega$

- s = domain complex frequency
- $\alpha$ = real part
- $\omega$ = imaginary part

### Continuous Time Representation

- Block diagram
- System function (Operator notation) (Y/X = H(A))
- impulse response
- Differential equation
- System function (Y(s) = H(s)X(s))

### Definition

Map function from time domain (t) to complex frequency domain (s)

- $X(s) = \int_{0}^{\infty}x(t)e^{-st}dt$ (Unilateral)
  - Biasa untuk sistem
- $X(s) = \int_{-\infty}^{\infty}x(t)e^{-st}dt$ (Bilateral)
  - Biasa untuk signal

### Contoh 1

$$x(t) = \begin{cases} e^{-t} & t \geq 0 \\ 0 & t < 0 \end{cases}$$

- $X(s) = \int_{-\infty}^{\infty}e^{-t}e^{-st}dt$
- $X(s) = \int_{0}^{\infty}e^{-t}e^{-st}dt$ (Piecewise)
- $X(s) = \int_{0}^{\infty}e^{-(s+1)t}dt$
- $X(s) = \frac{1}{s+1}$

> s bilangan kompleks dengan bentuk $\alpha + j\omega$

Dengan ROC $Re(s) > -1$

> Untuk convergence,  $lim_{t \to \infty}x(t) = 0$, $\frac{1}{s+1}$ harus konvergen, jadi $s+1 > 0$. Maka $Re(s) > -1$

#### Alasan ROC

Mengapa $Re(s) > -1$ dan bukan $s > -1$?

- $e^{pt} = e^{(a+jb)t}$
- $e^{pt} = e^{at}e^{jbt}$
- $e^{pt} = e^{at}(\cos(bt) + j\sin(bt))$

> $e^{at}$ mengatur tinggi, dan $\cos(bt) + j\sin(bt)$ hanya oscilasi. Yang mengatur konvergensi adalah $e^{at}$.

### Contoh 2

$$x(t) = \begin{cases} e^{-t} - e^{-2t} & t \geq 0 \\ 0 & t < 0 \end{cases}$$

- $X(s) = \int_{0}^{\infty}(e^{-t} - e^{-2t})e^{-st}dt$
- $X(s) = \int_{0}^{\infty}e^{-(s+1)t} - e^{-(s+2)t}dt$
- $X(s) = \frac{1}{s+1} - \frac{1}{s+2}$
- $X(s) = \frac{(s+2)-(s+1)}{(s+1)(s+2)}$
- $X(s) = \frac{1}{(s+1)(s+2)}$

ROC: $Re(s) > -2$ dan $Re(s) > -1$ (Intersect)  
ROC: $Re(s) > -1$ (Union)

### Fourier ROC

Fourier Transform only exists when ROC of LT includes imaginary axis (y-axis | x = 0)

### Contoh 3

$$x(t) = \begin{cases} e^{-t} & t \leq 0 \\ 0 & t > 0 \end{cases}$$

- $X(s) = \int_{-\infty}^{\infty}e^{-t}e^{-st}dt$
- $X(s) = \int_{-\infty}^{0}e^{-t}e^{-st}dt$
- $X(s) = \int_{-\infty}^{0}e^{-(s+1)t}dt$
- $X(s) = \frac{1}{s+1}$ (same as Contoh 1)

ROC: $Re(s) < 0$, agar konvergen (integral ada nilai), $e^{-(s+1)t}$ harus konvergen, maka $Re(s) < 0$

> ROC $Re(s) < -1$ (berbeda dengan Contoh 1)

### Contoh 4

$$x(t) = e^{-|t|}$$
$$x(t) = \begin{cases} e^{-t} & t \geq 0 \\ e^{t} & t < 0 \end{cases}$$

- $X(s) = \int_{-\infty}^{\infty}e^{-|t|}e^{-st}dt$
- $X(s) = \int_{-\infty}^{0}e^{t}e^{-st}dt + \int_{0}^{\infty}e^{-t}e^{-st}dt$
- $X(s) = \int_{-\infty}^{0}e^{(1-s)t}dt + \int_{0}^{\infty}e^{-(1+s)t}dt$
- $X(s) = \frac{1}{1-s} + \frac{1}{1+s}$
- $X(s) = \frac{2}{1-s^{2}}$

ROC: $1-s < 0$ (-infinity) dan $1+s > 0$ (+infinity)  
ROC $Re(s) < 1$ dan $Re(s) > -1$  
ROC $-1 < Re(s) < 1$

### Interpretation of ROC

![ROC Interpretation](./images/1b_LaplaceROC1.png)

Jika dikalikan signal biru dengan signal merah, hasilnya apakah konvergen?

![ROC Interpretation](./images/1b_LaplaceROC2.png)

Untuk signal 1 dan 2, hasil perkalian tidak cukup untuk membuat divergen, untuk signal 3, hasil perkalian tidak cukup untuk membuat konvergen.

![ROC Interpretation](./images/1b_LaplaceROC3.png)

Untuk signal 1 dan 2, hasil perkalian membuat divergen, untuk signal 3, hasil perkalian membuat konvergen.

### Contoh 5

Laplace transform corresponds to how many signals

$$\frac{2s}{s^{2}-4}$$

- $X(s) = \frac{2s}{s^{2}-4}$
- $X(s) = \frac{2s}{(s-2)(s+2)}$
- $X(s) = \frac{A}{s-2} + \frac{B}{s+2}$
- $X(s) = \frac{1}{s+2} + \frac{1}{s-2}$

4 permutations of signals

- pole -2 and pole 2

#### Pole -2

- $X(s) = \frac{1}{s+2}$
- $x(t) = e^{-2t}u(t)$ ROC $Re(s) > -2$ (Right sided signal)
- $x(t) = -e^{2t}u(-t)$ ROC $Re(s) < -2$ (Left sided signal)

#### Pole 2

- $X(s) = \frac{1}{s-2}$
- $x(t) = e^{2t}u(t)$ ROC $Re(s) > 2$ (Right sided signal)
- $x(t) = -e^{-2t}u(-t)$ ROC $Re(s) < 2$ (Left sided signal)

#### Combination

Find where there is ROC

- $Re(s) > 2$
  - $x(t) = e^{2t}u(t)$ ROC $Re(s) > 2$
  - $x(t) = e^{-2t}u(t)$ ROC $Re(s) > -2$
  - $x(t) = e^{2t}u(t) - e^{-2t}u(t)$ ROC $Re(s) > 2$
- $-2 < Re(s) < 2$
  - $x(t) = e^{2t}u(t) - e^{-2t}u(t)$ ROC $-2 < Re(s) < 2$
- $Re(s) < -2$
  - $x(t) = -e^{2t}u(-t)$ ROC $Re(s) < 2$
  - $x(t) = -e^{-2t}u(-t)$ ROC $Re(s) < -2$
  - $x(t) = -e^{2t}u(-t) - e^{-2t}u(-t)$ ROC $Re(s) < -2$

### Solving Differential Equation

- $y'(t) + y(t) = \delta(t)$
- $L(y'(t) + y(t)) = \delta(x(t))$
- $(sY(s) - y(0)) + Y(s) = 1$
- $Y(s) = \frac{1}{s+1}$
- $y(t) = e^{-t}u(t)$

> Mengapat bukan $-e^{-t}u(-t)$? Karena $x(0) = 0$

#### Sifting Property

Not shifting, but sifting

- $f(t)\delta(t) = f(0)$
- $f(t)\delta(t-t_0) = f(t_0)$

### Inverse Laplace Transform

- $x(t) = \frac{1}{2\pi j}\int_{\sigma-j\infty}^{\sigma+j\infty}X(s)e^{st}ds$

### Initial Value Theorem

if $lim_{s \to \infty} sX(s) = A$, then $lim_{t \to 0} x(t) = A$

#### Contoh

$F(s) = \frac{1}{s(s+2)}$

##### Cara transformasi biasa

- $F(s) = \frac{1}{s(s+2)}$
- $F(s) = \frac{1}{2}(\frac{1}{s} - \frac{1}{s+2})$
- $f(t) = \frac{1}{2}(1 - e^{-2t})$
- $f(0) = \frac{1}{2}(1 - e^{0}) = 0$

##### Cara Initial Value Theorem

- $lim_{s \to \infty} sF(s)$
- $lim_{s \to \infty} s\frac{1}{s(s+2)}$
- $lim_{s \to \infty} \frac{1}{s+2} = 0$

### Final Value Theorem

If $lim_{s \to 0}\ sX(s) = A$, then $lim_{t \to \infty} x(t) = A$

### Contoh 6

$F(s) = \frac{2}{s(s+2)(s+4)}$

#### Initial Value Theorem (IVT)

- $lim_{s \to \infty} sF(s)$
- $lim_{s \to \infty} s\frac{2}{s(s+2)(s+4)}$
- $lim_{s \to \infty} \frac{2}{(s+2)(s+4)} = 0$
- $lim_{t \to 0} f(t) = 0$

#### Final Value Theorem (FVT)

- $lim_{s \to 0} sF(s)$
- $lim_{s \to 0} s\frac{2}{s(s+2)(s+4)}$
- $lim_{s \to 0} \frac{2}{(s+2)(s+4)} = \frac{1}{4}$
- $lim_{t \to \infty} f(t) = \frac{1}{4}$

## Discrete Convolution (Week 2)

### Definisi

- Definisi: pergulatan dua signal
- Signal x(t) merupakan input dan h(t) merupakan system, h(t) adalah output dari system
- $y[n] = \sum_{k=-\infty}^{\infty}x[k]h[n-k]$
- $y(t) = \int_{-\infty}^{\infty}x(\tau)h(t-\tau)d\tau$
- $y(t) = (x*h)(t)$

> Definisi lain h(t) adalah respon dari system terhadap impulse

### Mencari respon dari system arbitrary system (konvolusi system $y[n]$ dengan signal $x[n]$)

- $y[n] = x[n] + x[n-1] + x[n-2]$
- $x[n] = \delta[n] + \delta[n-1] + \delta[n-2]$

Saat diberi input x[n] pada system y[n], nilai y[n] adalah respon dari system terhadap input x[n]

- $y[0] = x[0] + x[-1] + x[-2] = 1 + 0 + 0 = 1$
- $y[1] = x[1] + x[0] + x[-1] =  1 + 1 + 0 = 2$
- $y[2] = x[2] + x[1] + x[0] = 1 + 1 + 1 = 3$
- $y[3] = x[3] + x[2] + x[1] = 0 + 1 + 1 = 2$
- $y[4] = x[4] + x[3] + x[2] = 0 + 0 + 1 = 1$
- $y[5] = x[5] + x[4] + x[3] = 0 + 0 + 0 = 0$
- $y[6] = x[6] + x[5] + x[4] = 0$

#### Menggunakan superposition

![superposition](./images/2_Superposition.png)

- $x[n]$ dipisah untuk setiap n
- hasil dari setiap n bagi $y[n]$ dijumlahkan

> Hanya berlaku untuk system linear time invariant (LTI): Jika input digeser sebanyak n, output juga digeser sebanyak n dengan bentuk yang sama $\alpha x[n] + \beta x[n] \rightarrow \alpha y[n] + \beta y[n]$ dan $x[n - n_0] \rightarrow y[n - n_0]$

### Rumus

- $$y[n] = \sum_{k=-\infty}^{\infty}x[k]h[n-k]$$

### Step by step

1. $h[n] \rightarrow h[-n]$ (flip)
2. $h[-n] \rightarrow h[-n + k]$ (shift)
3. $x[k]h[-n + k] \rightarrow x[k]h[n - k]$ (multiply)
4. $\sum_{k=-\infty}^{\infty}x[k]h[n-k]$ (sum)

#### Contoh

![2_ContohConvolusi1](./images/2_ContohConvolusi1.png)

setelah ini melakukan untuk setiap y[n]

## Continuous Convolution (Week 2)

### Rumus

- $y(t) = \int_{-\infty}^{\infty}x(\tau)h(t-\tau)d\tau$

### Step by step

![2b_ContohConvolusiCT](./images/2b_ContohConvulasiCT.png)

1. $h(t) \rightarrow h(-t)$ (flip)
2. $h(-t) \rightarrow h(-t + \tau)$ (shift)
3. $x(\tau)h(-t + \tau) \rightarrow x(\tau)h(t - \tau)$ (multiply)
4. $\int_{-\infty}^{\infty}x(\tau)h(t-\tau)d\tau$ (integrate)

### Contoh

[video penjelasan](https://youtu.be/65BlcTQqpDg?si=NK64os0USztf85qH)

## Fourier (Week 3)

- Continuos signal: sumbu y tidak ada yang terputus
- Discontinuos signal: sumbu y terputus (contoh: square wave)
- Discrete signal: sumbu x terputus

### Properties of Harmonics

Multiplieng two harmonics produces another harmonic with the same fundamental frequency

$e^{j k \omega_0 t} \times e^{j m \omega_0 t} = e^{j (k+m) \omega_0 t}$

Integral of a harmonic over any time interval with length T is zero unless the harmonic is a constant

$\int_{t_0}^{t_0+T} e^{j k \omega_0 t} dt = 0$ unless $k = 0$  
$\int_{t_0}^{t_0+T} e^{j 0 \omega_0 t} dt = T\delta(k)$

### Fourier Series

- $\omega_0 = \frac{2\pi}{T}$

#### Analysis equation

- $a_k = \frac{1}{T}\int_{t_0}^{t_0+T}x(t)e^{-j k \omega_0 t} dt$
- $a_k = \frac{1}{T}\int_{0}^{T}x(t)e^{-j k \omega_0 t} dt$

#### Synthesis equation

- $x(t) = \sum_{k=-\infty}^{\infty}a_k e^{j k \omega_0 t}$

### Diferrential of Fourier Series

- $x'(t) = \sum_{k=-\infty}^{\infty} (j k \omega_0 a_k) e^{j k \omega_0 t}$
- $\int_{t_0}^{t_0+T}x(t)dt = \sum_{k=-\infty}^{\infty} \frac{a_k}{j k \omega_0} e^{j k \omega_0 t}$
- Square wave kalau diintegrasikan akan menjadi triangle wave
- Triangle wave kalau diderivasi akan menjadi square wave

#### Gibbs Phenomenon

- Square wave approximation
- $x(t) = \sum_{k=1}^{N} \frac{4}{\pi(2k-1)}\sin((2k-1)\omega_0 t)$
- Memiliki overshoot sebesar 9% dari nilai maksimum

## Aperiodic Signal (Week 4)

- $x(t) = \frac{1}{2\pi}\int_{-\infty}^{\infty}E(\omega)e^{j\omega t}d\omega$
- $E(\omega) = \int_{-\infty}^{\infty}x(t)e^{-j\omega t}dt$

### Fourier Transform

- $X(j\omega) = \int_{-\infty}^{\infty}x(t)e^{-j\omega t}dt$ (Analysis equation)
- $x(t) = \frac{1}{2\pi}\int_{-\infty}^{\infty}X(j\omega)e^{j\omega t}d\omega$ (Synthesis equation)
- Analysis equation: mengubah signal dari time domain ke frequency domain
- Synthesis equation: mengubah signal dari frequency domain ke time domain

### Relation Between Fourier and Laplace

Laplace transform is a generalization of Fourier transform

$$X(s) = \int_{-\infty}^{\infty}x(t)e^{-st}dt$$

Fourier transform is a special case of Laplace transform

$$X(j\omega) = \int_{-\infty}^{\infty}x(t)e^{-j\omega t}dt = X(s)|_{s = j\omega}$$

> Mengapa ditulis $X(j\omega)$ dan bukan $X(\omega)$? Karena $\omega$ adalah bilangan real, sedangkan $s$ adalah bilangan kompleks, kita hanya mengambil $\omega$ dari $s = \sigma + j\textcolor{red}{\omega}$

#### Region of Convergence (ROC)

Jika laplace termasuk sumbu imajiner(Y), maka terdapat fourier transform

#### Contoh

- $x(t) = e^{-t}u(t)$
- $X(s) = \frac{1}{s-1}$
- $X(j\omega) = \frac{1}{j\omega - 1}$ (j\omega = harus ada di ROC)

### Scaling Property

- $x_2(t) = x_1(at)$
- $X_2(j\omega) = \frac{1}{|a|}X_1(\frac{j\omega}{a})$
- $x_2(t) \sim \frac{1}{|a|}X_1(\frac{j\omega}{a})$

### Area Under the Curve

- Area under the curve of $x(t)$ is equal to the height $X(0)$
- Area of the curve of $X(j\omega)$ is equal to $2\pi x(0)$
- Area of the curve of $X(j\omega)$ is equal to $T$ (period) times $x(0)$

### Fourier and Inverse

- $X(j\omega) = \int_{-\infty}^{\infty}x(t)e^{-j\omega t}dt$
- $x(t) = \frac{1}{2\pi}\int_{-\infty}^{\infty}X(j\omega)e^{j\omega t}d\omega$

### Rumus Cepat Square Wave

- $x(t) = \begin{cases}
1 & -T < 0 < T \\
0 & otherwise
\end{cases}$
- $X(j\omega) = (2T)\frac{sin(T j\omega )}{j\omega T}$
- $X(j\omega) = (2T)sinc(T j\omega)$

#### Rect function

$rect(\frac{t}{T}) = \begin{cases}
1 & -\frac{T}{2} < 0 < \frac{T}{2} \\
0 & otherwise
\end{cases}$

- $x(t) = rect(\frac{t}{T})$
- $X(j\omega) = T\frac{sin(j\omega T)/2}{j\omega T/2}$
- $X(j\omega) = Tsinc(j\omega T/2)$

### Delta Function

- $x(t) = a\delta(t)$
- $X(j\omega) = a$

dan sebaliknya

- $x(t) = a$
- $X(j\omega) = 2\pi\ a\delta(\omega)$

### Time Shifting

- $x_2(t) = x_1(t-t_0)$
- $X_2(j\omega) = X_1(j\omega)e^{-j\omega t_0}$

### Time Transformation

- $x_2(t) = x_1(at - t_0)$
- $X_2(j\omega) = \frac{1}{|a|}X_1(\frac{j\omega}{a})e^{-j\frac{\omega}{a} t_0}$

### Convolution

- $y(t) = x(t)*h(t)$
- $Y(j\omega) = X(j\omega)H(j\omega)$

## DFT (Week 5)

### DTFT

- $X(e^{j\omega}) = \sum^\infty_n x[n]e^{-j\omega n}$
- $x[n] = \frac{1}{2\pi}\int^{\pi}_{-\pi} X(e^{j\omega})e^{j\omega n}d\omega$

#### Contoh

- $x[n] = a^n u[n]$
- $X(e^{j\omega}) = \sum^\infty_{-\infty} a^n u[n]e^{-j\omega n}$
- $X(e^{j\omega}) = \sum^\infty_0 a^n e^{-j\omega n}$
- $X(e^{j\omega}) = \sum^\infty_0 (ae^{-j\omega})^n$
- $X(e^{j\omega}) = \frac{1}{1-ae^{-j\omega}}$ (geometric series)

#### Contoh 2

- $x[n] = 2 (3)^n u[-n]$
- $X(e^{j\omega}) = \sum^\infty_{-\infty} 2 (3)^n u[-n]e^{-j\omega n}$
- $X(e^{j\omega}) = \sum^0_{-\infty} 2 (3)^n e^{-j\omega n}$
- $X(e^{j\omega}) = \sum^0_{-\infty} 2 (3e^{-j\omega})^n$
- $X(e^{j\omega}) = \sum^\infty_0 2 (3e^{-j\omega})^{-n}$
- $X(e^{j\omega}) = \frac{2}{1-e^{-j\omega}/3}$

### DFT

- Sampling DTFT
- $X[k] = \sum^{N-1}_{n=0} x[n]e^{-j\frac{2\pi}{N}kn}$
- $x[n] = \frac{1}{N}\sum^{N-1}_{k=0} X[k]e^{j\frac{2\pi}{N}kn}$

#### Example

Persamaan awal

- $x_1[n] = \begin{bmatrix} 1 \\ 1 \\ 1 \\ 1 \end{bmatrix}$
- $x_2[n] = \begin{bmatrix} 1 \\ 0 \\ 1 \\ 0 \end{bmatrix}$

DFT

- $X_1[k] = \sum^{3}_{n=0} x_1[n]e^{-j\frac{2\pi}{4}kn}$
- $X_1[k] = x[0]e^0 + x[1]e^{-j\frac{\pi}{2}k} + x[2]e^{-j\pi k} + x[3]e^{-j\frac{3\pi}{2}k}$
- $X_1[0] = x[0]e^0 + x[1]e^0 + x[2]e^0 + x[3]e^0 = 4$
- $X_1[1] = x[0]e^0 + x[1]e^{-j\frac{\pi}{2}} + x[2]e^{-j\pi} + x[3]e^{-j\frac{3\pi}{2}} = 0$
- $X_1[2] = x[0]e^0 + x[1]e^{-j\pi} + x[2]e^{-j2\pi} + x[3]e^{-j3\pi} = 0$
- $X_1[3] = x[0]e^0 + x[1]e^{-j\frac{3\pi}{2}} + x[2]e^{-j3\pi} + x[3]e^{-j\frac{9\pi}{2}} = 0$

> Representasi Matrix (Rumus Umum)
>
> $\begin{bmatrix} X[0] \\ X[1] \\ X[2] \\ X[3] \end{bmatrix} = \begin{bmatrix} 1 & 1 & 1 & 1 \\ 1 & -j & -1 & j \\ 1 & -1 & 1 & -1 \\ 1 & j & -1 & -j \end{bmatrix} \begin{bmatrix} x[0] \\ x[1] \\ x[2] \\ x[3] \end{bmatrix}$

Soal 2

- $X_2[k] = \sum^{3}_{n=0} x_2[n]e^{-j\frac{2\pi}{4}kn}$
- $\begin{bmatrix} X_2[0] \\ X_2[1] \\ X_2[2] \\ X_2[3] \end{bmatrix} = \begin{bmatrix} 1 & 1 & 1 & 1 \\ 1 & -j & -1 & j \\ 1 & -1 & 1 & -1 \\ 1 & j & -1 & -j \end{bmatrix} \begin{bmatrix} 1 \\ 0 \\ 1 \\ 0 \end{bmatrix} = \begin{bmatrix} 2 \\ 0 \\ 2 \\ 0 \end{bmatrix}$

### FFT

- Fast Fourier Transform (Fast DFT)
- DFT Simetrik dan periodik
- $X[k] = \sum^{N-1}_{n=0} x[n]W_N^{kn}$
- $W_N = e^{-j\frac{2\pi}{N}}$

#### Matrix

- $W_4 = e^{-j\frac{2\pi}{4}} = e^{-j\frac{\pi}{2}} = -j$
- $\begin{bmatrix} W_4^0 & W_4^0 & W_4^0 & W_4^0 \\ W_4^0 & W_4^1 & W_4^2 & W_4^3 \\ W_4^0 & W_4^2 & W_4^4 & W_4^6 \\ W_4^0 & W_4^3 & W_4^6 & W_4^9 \end{bmatrix} = \begin{bmatrix} 1 & 1 & 1 & 1 \\ 1 & -j & -1 & j \\ 1 & -1 & 1 & -1 \\ 1 & j & -1 & -j \end{bmatrix}$
- Periodik
- $\begin{bmatrix} W_4^0 & W_4^0 & W_4^0 & W_4^0 \\ W_4^0 & W_4^1 & W_4^2 & W_4^3 \\ W_4^0 & W_4^2 & W_4^0 & W_4^2 \\ W_4^0 & W_4^3 & W_4^2 & W_4^1 \end{bmatrix} = \begin{bmatrix} 1 & 1 & 1 & 1 \\ 1 & -j & -1 & j \\ 1 & -1 & 1 & -1 \\ 1 & j & -1 & -j \end{bmatrix}$

#### Decomposition matrix

- $\begin{bmatrix} W_4^0 & W_4^0 & W_4^0 & W_4^0 \\ W_4^0 & W_4^1 & W_4^2 & W_4^3 \\ W_4^0 & W_4^2 & W_4^0 & W_4^2 \\ W_4^0 & W_4^3 & W_4^2 & W_4^1 \end{bmatrix} = \begin{bmatrix} 1 & W_4^0 & 0 & 0 \\ 1 & W_4^2 & 0 & 0 \\ 0 & 0 & 1 & W_4^1 \\ 0 & 0 & 1 & W_4^3 \end{bmatrix} \begin{bmatrix} 1 & 0 & W_4^0 & 0 \\ 0 & 1 & 0 & W_4^0 \\ 1 & 0 & W_4^2 & 0 \\ 0 & 1 & 0 & W_4^2 \end{bmatrix}$

#### Contoh 8 point

- $W_8 = e^{-j\frac{2\pi}{8}} = e^{-j\frac{\pi}{4}} = \frac{\sqrt{2}}{2} - j\frac{\sqrt{2}}{2}$
- $\begin{bmatrix}
W_8^0 & W_8^0 & W_8^0 & W_8^0 & W_8^0 & W_8^0 & W_8^0 & W_8^0 \\
W_8^0 & W_8^1 & W_8^2 & W_8^3 & W_8^4 & W_8^5 & W_8^6 & W_8^7 \\
W_8^0 & W_8^2 & W_8^4 & W_8^6 & W_8^8 & W_8^{10} & W_8^{12} & W_8^{14} \\
W_8^0 & W_8^3 & W_8^6 & W_8^9 & W_8^{12} & W_8^{15} & W_8^{18} & W_8^{21} \\
W_8^0 & W_8^4 & W_8^8 & W_8^{12} & W_8^{16} & W_8^{20} & W_8^{24} & W_8^{28} \\
W_8^0 & W_8^5 & W_8^{10} & W_8^{15} & W_8^{20} & W_8^{25} & W_8^{30} & W_8^{35} \\
W_8^0 & W_8^6 & W_8^{12} & W_8^{18} & W_8^{24} & W_8^{30} & W_8^{36} & W_8^{42} \\
W_8^0 & W_8^7 & W_8^{14} & W_8^{21} & W_8^{28} & W_8^{35} & W_8^{42} & W_8^{49} \\
\end{bmatrix}$

#### Contoh soal

$f(t) = 5 + 2\cos(2\pi t - 90^\circ) + 3\cos(4\pi t)$

- Sampling $f_s = 4Hz$
- $f_s = 4Hz$
- $T = \frac{1}{f_s} = \frac{1}{4} = 0.25s$
- $N = 4$

$f[n] = 5 + 2cos(\pi n/2 - 90^\circ) + 3cos(\pi n)$

- $f[0] = 5 + 2cos(-90^\circ) + 3cos(0) = 5 + 0 + 3 = 8$
- $f[1] = 5 + 2cos(0) + 3cos(\pi) = 5 + 2 + -3 = 4$
- $f[2] = 5 + 2cos(90^\circ) + 3cos(2\pi) = 5 + 0 + 3 = 8$
- $f[3] = 5 + 2cos(180^\circ) + 3cos(3\pi) = 5 - 2 - 3 = 0$

$X[k] = W_4 f[n]$
$\begin{bmatrix} X[0] \\ X[1] \\ X[2] \\ X[3] \end{bmatrix} = \begin{bmatrix} 1 & 1 & 1 & 1 \\ 1 & -j & -1 & j \\ 1 & -1 & 1 & -1 \\ 1 & j & -1 & -j \end{bmatrix} \begin{bmatrix} 8 \\ 4 \\ 8 \\ 0 \end{bmatrix} = \begin{bmatrix} 20 \\ -4j \\ 12 \\ 4j \end{bmatrix}$

## Aplikasi DFT (Week 6)
