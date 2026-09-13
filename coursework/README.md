# Coursework

Programming work from the Physics BSc, outside the four simulations in `src/`.
Everything here compiles and runs.

```sh
./build.sh          # compiles all 47 programs into bin/
```

Requires `g++` and `gfortran`. The Fortran is fixed-form Fortran 77 and needs
`-std=legacy`, which the script applies.

---

## `cpp/` — C++

**`projects/`** — the larger pieces, each several files:

- **`matrix-class/`** — a matrix class with operator overloading, built over a
  header, implementation and driver.
- **`vector-class/`** — the same exercise for vectors.
- **`travelling-salesman/`** — three attempts at the travelling salesman
  problem, reading a distance matrix from `distancias.txt`. `main.cpp` is the
  finished one; `main-early.cpp` and `main-alt.cpp` are earlier approaches.

**`labs/`** — the laboratory assignments, one folder per session: numerical
series and π, logarithms, file handling, sorting words read from disk.

## `fortran/` — Numerical methods

Fixed-form Fortran 77, one folder per laboratory:

| | |
|---|---|
| `lab-1` | Lagrange interpolation |
| `lab-2` | numerical integration — trapezoid and Simpson, with subinterval refinement |
| `lab-3` | iterative solution of linear systems |
| `lab-4` | root finding |
| `lab-5` | matrix handling and prime generation |
| `sorting` | bubble sort, in memory and against a file |

Programs read their input from the `.txt` files beside them and write results
back out, so each folder runs self-contained.

## `optics/` — Optics II laboratory

Two Jupyter notebooks, the most substantial analysis here:

- **`lab-5-signal-transmission/`** — signal transmission measurements fitted
  with `scipy.optimize.curve_fit` and `kapteyn.kmpfit`, with χ² goodness of
  fit against the measured data in the accompanying `.txt` files.
- **`lab-6/`** — spectral analysis of LED, helium and sodium discharge, and
  diode and He-Ne laser sources, using a Butterworth filter and `scipy.signal`.
  MATLAB scripts for the same data sit alongside.
