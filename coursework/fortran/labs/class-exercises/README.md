# Class exercises

Two short Fortran 77 programs written during class.

- **`circulo.f`** — reads a radius and calls an internal subroutine to return
  the area; an exercise in `contains` and subroutine arguments.
- **`integral.f`** — numerical integration by rectangles, reading the limits
  and the maximum subdivision count from `integral.dat`, then sweeping
  *N* = 10, 20, … up to that maximum and writing each result to
  `resultados.dat` so the convergence can be plotted.

```bash
gfortran -std=legacy -o integral integral.f && ./integral
```
