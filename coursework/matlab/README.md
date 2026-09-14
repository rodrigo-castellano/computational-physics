# MATLAB exercises

Problem sheet 7 from the MATLAB course, Physics BSc, Universidad de Granada.
Written as standalone functions, no toolboxes.

| file | what it does |
|---|---|
| `busqueda.m`, `busquedaBinaria.m` | binary search over a sorted vector, two versions; both return the index or −1 |
| `ordenar.m` | selection sort |
| `contdiv.m` | counts the divisors of every element of a vector, and returns those with exactly two — that is, the primes |
| `divisible.m` | whether every element of a vector divides by `d`, short-circuiting on the first failure |
| `fibo.m` | the *n*-th Fibonacci term |
| `fibo2.m` | takes a vector of term indices and returns those terms |
| `fibo3.m` | the same, but sorts the requested indices first so the series is generated once instead of restarted per element |
| `psilla.m` | finds saddle points of a matrix — entries that are the minimum of their row and the maximum of their column |
| `moneda.m` | coin change: given the coins inserted, a price and the coins in the machine, decides whether it can be paid, whether change can be made, and returns the change |

Filenames match the function names because MATLAB requires it, so they keep
their original Spanish names.

**Note:** `fibo3.m` calls `ordenaSeleccion`, which is not in this set.
`ordenar.m` is the selection sort it expects — rename it, or change the call,
to run `fibo3`.
