# Computational Physics — Fortran

Simulations written for *Física Computacional*, Physics BSc, Universidad de
Granada. Fortran 77 (fixed-form) and Fortran 90, all still building and running
on gfortran 16.

Four physical systems, each kept in the successive versions they were actually
written in — the iteration is part of the record.

| | what it does |
|---|---|
| `src/ising/` | 2D Ising model, Metropolis Monte Carlo, with a hand-written RNG (`randomnumber.f`) |
| `src/solar-system/` | 10-body gravitational integrator: positions, velocities, angular momentum, energy, orbital periods |
| `src/schrodinger/` | 1D time-dependent Schrödinger equation: wavefunction, norm, transmission coefficient |
| `src/rocket/` | Earth–Moon spacecraft trajectory |
| `src/exercises/` | small course exercises (circle area, numerical integration, matrix max) |

## Build and run

```sh
make                 # builds 15 executables into bin/
./verify.sh          # builds, runs everything, checks the results
```

Needs `gfortran` and `make`. The 77 sources require `-std=legacy`; the
Makefile handles it.

Programs write their output to the working directory, so run each in its own:

```sh
mkdir -p out/sistemasolar && cd out/sistemasolar && ../../bin/sistemasolar
```

Some read parameters from stdin:

```sh
echo 2.0 | ./bin/ising_v1_standalone     # temperature
echo 16  | ./bin/ising_v4_observables    # lattice size: 16, 32, 64 or 128
echo 2.0 | ./bin/circulo                 # radius
```

## Does it actually work?

`./verify.sh` checks the output against known results — 13 checks, all passing:

```
integral        ∫₀¹x² dx      0.33335        (exact 1/3)
circulo         area(r=2)     12.56637       (exact 4π)
ising_v4        order parameter collapses between T=2.3 and T=2.5,
                bracketing the exact Onsager point Tc = 2/ln(1+√2) = 2.269
sistemasolar    orbital periods against the real solar system:
                  Venus    0.621 yr  (0.615)    Jupiter  11.876 yr  (11.86)
                  Earth    1.003 yr  (1.000)    Saturn   29.593 yr  (29.46)
                  Mars     1.878 yr  (1.881)    Uranus   84.307 yr  (84.01)
                  Neptune 163.010 yr (164.8)    Pluto   246.807 yr  (248.1)
                  Mercury  0.271 yr  (0.241) — 12%, see below
```

## Changes made to the original code

The physics is untouched. These were needed to build and run:

1. **`solar-system/sistemasolar.f` — orbital period measurement was wrong.**
   The original tested `r(u,1) > 0` (the *x* coordinate) to detect half an
   orbit, though the author's own comment and the working Earth branch use the
   *y* sign change. Since every planet starts at x > 0, all of them triggered
   on iteration 1 and reported the same period.
   Timing a half orbit from t=0 is also only valid for a planet starting on the
   +x axis — true for Earth and Uranus, not the rest, which start at other
   angles. Replaced with a full orbit timed between two successive descending
   crossings of y=0, which is independent of where each planet starts. The
   original is kept at `drafts/sistemasolar_original_period_bug.f`.
2. **`exercises/rodrigo.f`** — `if (...)` with no `then`, so it did not
   compile. Added `then`. It also computed the maximum and never printed it;
   added one `write`.
3. **`exercises/prueba.f`** — a stray `1` at the end of a `read` statement.
   Removed.
4. Stale 2015 `.mod` files in the source tree made the Ising programs fail to
   build. The Makefile compiles the module into `build/` instead.

## Known issues

- **Mercury, 12% off.** Fastest and most eccentric planet, undersampled by the
  fixed step h = 0.1. Smaller h fixes it.
- **`nave_v1` does not terminate** — an earlier draft with an unbounded loop.
  `nave_v2` is the finished version. Kept for comparison.
- **`rodrigo.f`** declares `maximo` as `integer*8` while the matrix is
  `real*8`, so a non-integer maximum would be truncated. Left as written; the
  supplied data is integers.
- `drafts/` holds three files that do not compile and are superseded:
  `ising_incomplete.f` (an `if` with no `end if`), `cuantica_rank_bug.f`
  (indexes a 1-D array as 2-D; `schrodinger/cuanticadef.f` is the fixed
  version), and `sistemasolar_early.f`.

## Layout

```
src/        the programs, by physical system
data/       the two input files any program reads (integral.dat, rodrigo.dat)
drafts/     superseded or broken versions, kept deliberately, not built
verify.sh   build + run + check against known physics
```

Everything else — `.dat`, `Datos`, `Norma`, `Transmision` — is generated
output and is gitignored. Re-running the programs regenerates it.
