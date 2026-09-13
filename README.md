# Computational Physics

Simulations written for **Física Computacional**, Physics BSc, Universidad de
Granada. Fortran 77 and Fortran 90, still building and running on gfortran 16.

Four physical systems, each kept in the successive versions they were actually
written in — the iteration is part of what the course looked like.

| | |
|---|---|
| **Ising model** | 2D lattice, Metropolis Monte Carlo, hand-written RNG. Four versions, ending with a temperature sweep that measures energy, magnetisation and specific heat. |
| **Solar system** | 10-body gravitational integrator. Positions, velocities, angular momentum, energy, and the orbital period of every planet. |
| **Schrödinger** | 1D time-dependent Schrödinger equation, Crank–Nicolson. Wavefunction and norm. |
| **Spacecraft** | Earth–Moon trajectory in the rotating frame, with a Hamiltonian conservation check. |

Plus a few small course exercises: circle area, numerical integration, matrix maximum.

## It works, and here is the evidence

`./verify.sh` builds all 14 programs, runs each one and checks its output
against known physics. **16 checks, all passing.**

**The solar system reproduces the real one.** Orbital periods, from a
simulation that only knows Newton's law and the initial positions:

| | computed | actual | | | computed | actual |
|---|---|---|---|---|---|---|
| Venus | 0.621 yr | 0.615 | | Jupiter | 11.876 yr | 11.86 |
| Earth | 1.003 yr | 1.000 | | Saturn | 29.593 yr | 29.46 |
| Mars | 1.878 yr | 1.881 | | Uranus | 84.307 yr | 84.01 |
| Neptune | 163.010 yr | 164.8 | | Pluto | 246.807 yr | 248.1 |

and the perihelion speeds land within 0.2%: Earth 30 281 m/s (actual 30 290),
Jupiter 13 703 (13 720), Neptune 5 481 (5 470).

**The Ising model finds its own critical point.** The order parameter
collapses between T = 2.3 and T = 2.5, bracketing the exact Onsager value
Tc = 2/ln(1+√2) = 2.269 — with no knowledge of that result in the code.

**Schrödinger stays unitary.** Norm drift 4×10⁻¹³ over 2800 steps.

**The spacecraft integrator converges.** Hamiltonian drift 1.5×10⁻⁵ at h=25,
3.0×10⁻⁸ at h=5 — a 500× improvement for a 5× smaller step, as a 4th-order
method should.

## Build and run

```sh
make          # 14 executables into bin/
./verify.sh   # build, run everything, check the physics
```

Needs `gfortran` and `make`. The Fortran 77 sources need `-std=legacy`; the
Makefile handles it.

Programs write output to the working directory, so give each its own:

```sh
mkdir -p out/sistemasolar && cd out/sistemasolar && ../../bin/sistemasolar
```

Some take a parameter on stdin:

```sh
echo 2.0 | ./bin/ising_v1_standalone    # temperature
echo 16  | ./bin/ising_v4_observables   # lattice size: 16, 32, 64, 128
echo 2.0 | ./bin/circulo                # radius
```

## Changes to the original code

The physics is untouched. Three fixes were needed to build and run, and the
originals are kept in `drafts/`:

1. **`sistemasolar.f` measured orbital periods wrongly.** It tested `r(u,1)`,
   the *x* coordinate, to detect half an orbit — though the author's own
   comment and the working Earth branch use the *y* sign change. Every planet
   starts at x > 0, so all of them triggered on the first iteration and
   reported the same period. Timing a half orbit from t=0 is also only valid
   for a planet starting on the +x axis, true for Earth and Uranus but not the
   rest. Now it times a full orbit between two successive descending crossings
   of y = 0, independent of where each planet starts. That is what produces
   the table above.
2. **`rodrigo.f`** had `if (...)` with no `then`, so it did not compile. It
   also computed the maximum and never printed it.
3. **`prueba.f`** had a stray character in a `read` statement.

Stale 2015 `.mod` files in the source tree also broke the Ising builds; the
Makefile now compiles the module into `build/`.

## Things left as they were

- `schrodinger_v1/v2` open a `Transmision` file and never write to it — the
  transmission coefficient was never implemented.
- `ising_v3_observables` has its `write(8,...)` commented out, so its
  `datos.dat` comes out empty. `ising_v4_observables` is the version where
  that output is enabled.
- Mercury's period is 12% off: it is the fastest and most eccentric planet and
  the fixed step h = 0.1 undersamples it. Everything else is within ~1%.
- `rodrigo.f` declares `maximo` as `integer*8` against a `real*8` matrix, so a
  non-integer maximum would truncate. The supplied data is integers.

`drafts/` holds four files that are superseded or do not compile, kept
deliberately and not built: `ising_incomplete.f` (an `if` with no `end if`),
`cuantica_rank_bug.f` (indexes a 1-D array as 2-D — `schrodinger/cuanticadef.f`
is the fixed version), `sistemasolar_early.f`, and `prueba_scratch_oob.f`
(allocates `F(1:Nx,3:Ny)` then reads from index 1).

## Layout

```
src/        the programs, by physical system
data/       the two input files any program reads
drafts/     superseded or broken versions, kept, not built
verify.sh   build + run + check against known physics
```

Everything else — `.dat`, `Datos`, `Norma` — is generated output, gitignored,
and reproduced by running the programs.
