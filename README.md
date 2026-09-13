# Computational Physics

Numerical simulations of four physical systems, written in Fortran 77 and
Fortran 90 for the *Física Computacional* course of the Physics BSc at the
Universidad de Granada.

Each system is kept in the successive versions it was developed through, so
the progression from a first working integrator to one that measures
observables is visible in the source.

---

## The simulations

### Ising model — `src/ising/`

A 2D spin lattice evolved by Metropolis Monte Carlo, with a hand-written
random number generator (`randomnumber.f`). The final version sweeps
temperature and measures energy, magnetisation and specific heat.

The model undergoes a phase transition, and the simulation finds it without
being told where it is. Sweeping a 16×16 lattice, the order parameter
collapses between T = 2.3 and T = 2.5:

| T | 1.9 | 2.1 | 2.3 | 2.5 | 2.7 | 2.9 |
|---|---|---|---|---|---|---|
| order parameter | 240.4 | 223.6 | 174.4 | 88.8 | 42.5 | 26.0 |

bracketing the exact Onsager result **T_c = 2 / ln(1 + √2) = 2.269**.

```sh
echo 16 | ./bin/ising_v4_observables     # lattice size: 16, 32, 64 or 128
```

### Solar system — `src/solar-system/`

A ten-body gravitational integrator: the Sun and nine planets, with only
Newton's law and the initial positions and velocities. It tracks position,
velocity, angular momentum and energy, and measures each orbital period by
timing a full revolution.

Given nothing but initial conditions, it reproduces the real solar system:

| planet | computed | actual | | planet | computed | actual |
|---|---|---|---|---|---|---|
| Mercury | 0.271 yr | 0.241 | | Jupiter | 11.876 yr | 11.86 |
| Venus | 0.621 yr | 0.615 | | Saturn | 29.593 yr | 29.46 |
| Earth | 1.003 yr | 1.000 | | Uranus | 84.307 yr | 84.01 |
| Mars | 1.878 yr | 1.881 | | Neptune | 163.010 yr | 164.8 |
| | | | | Pluto | 246.807 yr | 248.1 |

Mercury is the one outlier — it is the fastest and most eccentric planet, and
the fixed timestep undersamples its perihelion passage. Everything else lands
within about 1%.

`velocidades` computes the perihelion speeds, accurate to 0.2%: Earth
30 281 m/s against an actual 30 290, Jupiter 13 703 against 13 720.

### Schrödinger equation — `src/schrodinger/`

The one-dimensional time-dependent Schrödinger equation for a wave packet
meeting a potential barrier, integrated with a Crank–Nicolson scheme.

The scheme is unitary, so the norm of the wavefunction is a conserved
quantity and a direct check on the integration: it drifts by **4 × 10⁻¹³**
over 2800 timesteps.

### Spacecraft trajectory — `src/rocket/`

An Earth-to-Moon trajectory integrated in the frame co-rotating with the
Moon, using a Hamiltonian formulation in scaled units. The Hamiltonian is
conserved, which makes its drift a measure of integration quality:

| timestep | Hamiltonian drift |
|---|---|
| h = 25 | 1.5 × 10⁻⁵ |
| h = 5 | 3.0 × 10⁻⁸ |

A five-fold smaller step gives roughly 500× better conservation — the
fourth-order convergence the method should show.

---

## Building and running

Requires `gfortran` and `make`. The Fortran 77 sources need `-std=legacy`,
which the Makefile applies.

```sh
make          # builds 14 executables into bin/
./verify.sh   # builds, runs everything, checks the results against known physics
```

`verify.sh` is the quickest way to see the repository work: it runs all
fourteen programs and asserts the results above — the Onsager temperature,
the orbital periods, norm conservation, Hamiltonian convergence.

Programs write their output into the working directory, so give each its own:

```sh
mkdir -p out/sistemasolar && cd out/sistemasolar && ../../bin/sistemasolar
```

A few read a parameter from standard input:

```sh
echo 2.0 | ./bin/ising_v1_standalone    # temperature
echo 16  | ./bin/ising_v4_observables   # lattice size
echo 2.0 | ./bin/circulo                # radius
```

---

## Also in this repository

`coursework/` collects the other programming work from the degree — 371 files
of C++, Fortran, MATLAB and lab notebooks:

| | | |
|---|---|---|
| `programacion/` | 163 | C++ — textbook chapters, lab guiones, a travelling-salesman project |
| `metodos-numericos/` | 107 | Fortran — Métodos Numéricos y Simulación, exercises and lab practicals |
| `matlab/` | 85 | MATLAB problem sets and exam scripts |
| `optica/` | 12 | Optics II laboratory notebooks, signal transmission |
| `geofisica/` | 4 | Geophysics practical, seismic station data |

These are coursework rather than simulations and are not built by `make`.

`drafts/` keeps earlier versions that were superseded or left unfinished.
They are not built, and are there because the intermediate steps are part of
the record.

```
src/         the four simulations
coursework/  the rest of the degree's programming
data/        input files read by programs in src/
drafts/      superseded and unfinished versions
verify.sh    build, run and check against known physics
```
