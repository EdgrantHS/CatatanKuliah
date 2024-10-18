# **Aljabar Linear Lanjut Before UTS**

Link Emas: `https://emas2.ui.ac.id/course/view.php?id=60305`

----------------------------------------

# Week 2

- Bahas Tugas

## Superposisi dan fungsi linear

- Superposisi
  - f memenuhi superposisi jika f(ax + by) = af(x) + af(y) + ...
  - fungsi yang memnuhi superposisi adalah fungsi linear
- inner product function (dot product) linear
- fungsi basicalluy matrix yg transpose / iner product
- affine function
  - linear harus melewati titik 0 (mx)
  - affine tidak harus melewati titik 0 (mx + b)

## Taylor series

- approximation of function menjadi polinomial
- udah jago lah gak perlu penejlasan, materi kalkulus semester 1
- dapat ditulis sebagai inner product

## Regression model

- affine function of x
  - $y = Transpose(x)*b + v$
  - x = [x1, x2, x3, ...], xi = regressor / independent variable
  - b weight vector
  - v = offset

# Week 3 (Vector to Skalar)

$$\begin{bmatrix}2 \\ -2\end{bmatrix}
=
\alpha\begin{bmatrix}1 \\ 0\end{bmatrix}
+
\beta\begin{bmatrix}1 \\ -2\end{bmatrix}$$

- taylor series 2 dimensi
$$\hat{f}(x) = f(z) + \forall f(z)^{T}(x-z)$$
## Norm and distance
euclidian norm = $$||x|| = \sqrt{x_1^2 + x_2^2 + ... + x_n^2} = \sqrt{x^{T}x}$$
p-norm = $$||x|| = (\Sigma_{i = 1}^n x_i^p)^{1/p}$$
## Properti norm
- homogenity $||\beta x|| = |\beta|\cdot||x||$
- triangle innequality $||x + y|| \le ||x|| + ||y||$
- nonegativity: norm tak bisa negatif
- norm 0 jika vektor 0
### Mean square
mean dari square
$$\frac{x_1^2 + x_2^2 + ... + x_n^2}{n}=\frac{||x||^2}{n}$$
### Root mean square
mean square yang di root
$$rms(x) = \sqrt{\frac{x_1^2 + x_2^2 + ... + x_n^2}{n}}=\frac{||x||}{\sqrt{n}}$$
$$rms(1) = 1$$
### Chebyshev Inequalitty
fraction entries with $|x_i| \ge a$   is no more than $(\frac{rms(x)}{a})^2$

## Distance
$dist(a, b) = ||a - b||$
$rms(a-b) =$ deviasi rms antara a dan b
### Triangle inequality
## Std deviation
$avg(x) = 1^{T}x/n$  
$\tilde{x} = x - avg(x)$
$$std(x) = rms(\tilde{x}) = \frac{||x - avg(x)||}{\sqrt{n}}$$
std(x) = standard deviation
$$rms(x)^2 = avg(x)^2 + std(x)^2$$
$\mu = avg(x)$
$\sigma = std(x)$

dalam investasi, stddev melambangkan *risk* dan mean adalah *return*

### chebyshev inequality for std
$$|x_i - avg(x)| \ge \alpha\ std(x)$$
is no more than $1/\alpha^2$ for $(\alpha > 1)$

# Week 4 (Vector to Vector)
## Linearality
- f(x) = Ax
- A = matrix
- x = vektor
- f(x) = vektor
- Ruang f(x) dan x harus sama untuk linear
## Linear function
### Matrix reversal
- $I^{-1}$ = reversal matrix
$\begin{bmatrix}
0 & 0 & 1 \\
0 & 1 & 0 \\
1 & 0 & 0
\end{bmatrix}$
## Running sum
$\begin{bmatrix}
1 & 0 & 0 \\
1 & 1 & 0 \\
1 & 1 & 1
\end{bmatrix}$
## Example
### Price elasticity of demand
### Taylor series
## Regression model
- $\hat y = x^{T} \beta + v$
- $\hat y$ = prediction
- x = paramater vectors
- $\beta$ = weight vectors
- v = offset
- feature matrix = x (matriks yang berisi $x_i$)
$$\begin{bmatrix}
x_1{T} &&
x_2{T} &&
... \\
\end{bmatrix}$$
$$\begin{pmatrix}
\begin{bmatrix}
x_{11} \\ x_{12} \\ ... \\ x_{1n}
\end{bmatrix} &&
\begin{bmatrix}
x_{21} \\ x_{22} \\ ... \\ x_{2n}
\end{bmatrix} &&
... \\
\end{pmatrix}$$

- prediction error = $y - \hat y$
## System of linear equation
- $Ax = b$
- b = RHS (right hand side)
### underdetermined
- lebih banyak variabel daripada persamaan
- solusi tak unik
- wide matrix
### overdetermined
- lebih banyak persamaan daripada variabel
- solusi tak selalu ada
- tall matrix
- kebanan persamaan overdetermined karena di dunia nyata tidak tau variabel apa aja yang mempengaruhi
## CHemical exmaple
![image](https://media.discordapp.net/attachments/1168511160807604234/1212605362365014016/image.png?ex=65f271bf&is=65dffcbf&hm=d02fad8db7020aa6a58c86941dafd6a54f55a7fd22ae1c39c1c7a9f030b6b6f8&=&format=webp&quality=lossless&width=570&height=437)

# Week 5 (Linear dynamics)
## Linear dynamics
- $$x_{t+1} = Ax_t$$
- x = state vector
- A = state transition matrix
- t = time
- x_t = state vector at time t
- x_{t+1} = state vector at time t+1
- x_0 = initial state
## Time invariant
- A tidak bergantung pada waktu
- A = konstan
## With input
- $x_{t+1} = Ax_t + Bu_t + c_t$
- u = input vector
- B = input matrix
- c = offset
## K markov model
- $x_{t+1} = A_t x_t + A_{t - 1} x_{t - 1} + ...$
- autoregressive model
- dipengaruhi sebelum sebelum juga bukan hanya 1 sebelum
## Population distribution model
## SIR (Susceptible, Infected, Recovered) model

# Week 6 (Exerise)

# Aljabar Linear Lanjut (After UTS)

## Least square (Week 1)

**Video Bagus:** [khan academy](https://youtu.be/MC7l96tW8V8?si=nG4Uf8HlqdmBoQnj)

### Definisi

- Least Square adalah metode untuk mencari nilai yang paling mendekati dari data yang diberikan
- Kalau matrix tall artinya data yang mempengaruhi hasil. Jadi tidak pasti ada solusi untuk b
- Least Square akan mencari nilai yang paling mendekati dari data yang diberikan

### Rumus

- $Ax = b$  

- A = matrix tall
- x = variabel yang dicari

#### Mencari

- Cari $||A \hat x - b||^2$ paling kecil
- Cari turunan dari $||A \hat x - b||^2$ terhadap semyua $\hat x_i$ dan set sama dengan 0
  - Objective function $f(x)$: $||A \hat x - b||^2$ (fungsi tujuan)
  - Residual $r$: vector $A \hat x - b$

#### Rumus Cepat

$$\hat x = (A^{T}A)^{-1}A^{T}b$$
$A^{\dagger} = (A^{T}A)^{-1}A^{T}$  (pseudoinverse)
$\hat x = A^{\dagger}\ b$

## Solving Least Square (Week 2)

### QR Decomposition (Square Matrix)

Link Wikipedia: [QR Decomposition](https://en.wikipedia.org/wiki/QR_decomposition)

- $A = QR$
- Q = orthogonal matrix
- R = upper triangular matrix

#### Rumus QR

- $Q = \begin{bmatrix} q_1 & q_2 & q_3 \end{bmatrix}$

- $R = \begin{bmatrix} r_1 & r_2 & r_3 \\ 0 & r_2 & r_3 \\ 0 & 0 & r_3 \end{bmatrix}$

- $A = QR$

#### Rumus Least Square

- $Ax = b$
- $QRx = b$
- $Rx = Q^{T}b$
- $x = R^{-1}Q^{T}b$

### Back Substitution

- $R = \begin{bmatrix} r_1 & r_2 & r_3 \\ 0 & r_2 & r_3 \\ 0 & 0 & r_3 \end{bmatrix}$
- $R\hat x = Q^{T}b$

- $\hat x = R^{-1}Q^{T}b$

- $x_n = b_n / r_{nn}$

- $x_{n-1} = (b_{n-1} - r_{n-1,n}x_n) / r_{n-1,n-1}$ (Kayaknya salah, nanti cari sendiri lagi)

### complexity

- $T(n) = 2n^3 + 3n^2$
  - 2n^3 = back substitution
  - 3n^2 = QR decomposition
- $O(n^3)$

## Least Square Data Fitting (Week 2)

$y \approx f(x)$

- $x$ = independent variable (feature vector)
  - perbedaan feature dan variabel adalah feature adalah variabel yang mempengaruhi hasil
- $y$ = outcome variable (prediction)
- $f: R^n \rightarrow R$ relationship between $x$ and $y$
- $f(x)$ tidak diketahui, relationship antara $x$ dan $y$ tidak diketahui

### Some AI Terms

- $x$ = data
- $y$ = answer
- $(x, y)$ = dataset
- $f(x)$ = model
- model parameter = $\theta _i$
- $f(x) = \theta _0 + \theta _1x_1 + \theta _2x_2 + ... + \theta _nx_n$

### Meminimalkan Prediction Error Data Fitting

- $y \approx f(x)$

Minimize $||f(x) - y||^2$

- $||f(x) - y||^2$
- $||A \theta - y||^2 = 0$
- Minimize $||A \hat\theta - y||^2$
- Minimize MSE
  - $\frac{||A \hat\theta - y||^2}{N}$ = Mean Squared Error (MSE)
- Info tambahan gak masuk UTS: RMSE (Root Mean Squared Error) = $\sqrt{\frac{||A \hat\theta - y||^2}{N}}$
- Info tambahan gak masuk UTS: MAE (Mean Absolute Error) = $\frac{||A \hat\theta - y||}{N}$

#### Rumus Least Square Data Fitting

- $\hat\theta = (A^{T}A)^{-1}A^{T}y$
