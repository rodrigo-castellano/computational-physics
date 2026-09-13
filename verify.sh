#!/usr/bin/env bash
# Build every program, run it, and check its output against known physics.
set -u
R="$(cd "$(dirname "$0")" && pwd)"; cd "$R"
pass=0; fail=0
ok(){ printf "  \033[32mPASS\033[0m  %-28s %s\n" "$1" "${2:-}"; pass=$((pass+1)); }
no(){ printf "  \033[31mFAIL\033[0m  %-28s %s\n" "$1" "${2:-}"; fail=$((fail+1)); }
note(){ printf "  ....  %-28s %s\n" "$1" "${2:-}"; }
near(){ awk -v a="$1" -v b="$2" -v t="$3" 'BEGIN{d=(a-b)/b; if(d<0)d=-d; exit !(d<t)}'; }
run(){ local p=$1 inp=${2:-} s=${3:-600} d="$R/out/$1"
  rm -rf "$d"; mkdir -p "$d"; cp "$R"/data/*.dat "$d/" 2>/dev/null
  ( cd "$d" && printf '%b' "$inp" | timeout "$s" "$R/bin/$p" >stdout.txt 2>&1 ); }
# max relative drift of the last column of a file
drift(){ awk '{v=$NF+0; if(NR==1){mn=v;mx=v;f=v} if(v<mn)mn=v; if(v>mx)mx=v}
  END{b=(f<0?-f:f); if(b==0)b=1; printf "%.3e", (mx-mn)/b}' "$1"; }

echo "== build =="
make clean >/dev/null 2>&1
make >/dev/null 2>&1 && ok "make" "$(ls bin|wc -l) executables" || { no "make"; make; exit 1; }

echo "== exercises =="
run circulo "2.0\n"; a=$(awk 'NR==2{print $1}' out/circulo/stdout.txt)
near "$a" 12.566370614 1e-6 && ok "circulo" "area(r=2)=$a  (4pi)" || no "circulo" "$a"
run rodrigo; m=$(grep -o '[0-9]*$' out/rodrigo/stdout.txt|tail -1)
[ "$m" = 9 ] && ok "rodrigo" "matrix max = 9" || no "rodrigo" "$m"
run integral; v=$(tail -1 out/integral/resultados.dat|awk '{print $2}')
near "$v" 0.33333333 1e-3 && ok "integral" "int_0^1 x^2 = $v  (1/3)" || no "integral" "$v"

echo "== schrodinger  (norm must be conserved) =="
for p in schrodinger_v1 schrodinger_v2; do
  run $p "" 600; d=$(drift out/$p/Norma)
  awk -v d="$d" 'BEGIN{exit !(d<1e-9)}' && ok "$p" "norm drift $d over 2800 steps" || no "$p" "norm drift $d"
done
run cuanticadef "" 600; d=$(drift out/cuanticadef/Norma)
awk -v d="$d" 'BEGIN{exit !(d<1e-1)}' && ok "cuanticadef" "norm drift $d (weaker scheme)" || no "cuanticadef" "$d"

echo "== ising  (2D, exact Tc = 2/ln(1+sqrt2) = 2.269) =="
run ising_v1_standalone "2.0\n" 600
[ -s out/ising_v1_standalone/datos.dat ] && ok "ising_v1_standalone" "T=2.0 ordered lattice" || no "ising_v1_standalone"
run ising_v2 "" 600
[ -s out/ising_v2/datos.dat ] && [ -s out/ising_v2/repre.dat ] && ok "ising_v2" "lattice + snapshot" || no "ising_v2"
run ising_v3_observables "16\n" 600
n=$(wc -l < out/ising_v3_observables/energia.dat)
[ "$n" -gt 1000 ] && ok "ising_v3_observables" "energia.dat $n rows" || no "ising_v3_observables" "$n rows"
note "" "(its datos.dat write is commented out in the original source)"
run ising_v4_observables "16\n" 900
t=$(awk '$1>2.2&&$1<2.4{a=$2} $1>2.4&&$1<2.6{b=$2} END{if(a>0&&b>0&&b<a*0.7)print "y"}' out/ising_v4_observables/datos.dat)
[ "$t" = y ] && ok "ising_v4_observables" "order param collapses across Tc" || no "ising_v4_observables" "no transition"

echo "== rocket  (Hamiltonian must be conserved; smaller h = better) =="
run nave_v1 "" 900; d1=$(drift out/nave_v1/ch.txt)
awk -v d="$d1" 'BEGIN{exit !(d<1e-4)}' && ok "nave_v1" "h=25, H drift $d1" || no "nave_v1" "$d1"
run nave_v2 "" 900; d2=$(drift out/nave_v2/ch.txt)
awk -v d="$d2" 'BEGIN{exit !(d<1e-6)}' && ok "nave_v2" "h=5,  H drift $d2" || no "nave_v2" "$d2"
awk -v a="$d1" -v b="$d2" 'BEGIN{exit !(b<a)}' && ok "nave h-convergence" "$d1 -> $d2 as h drops 25->5" || no "nave h-convergence"

echo "== solar system =="
run sistemasolar "" 900
python3 - <<'PY'; rc=$?
real={2:0.241,3:0.615,4:1.000,5:1.881,6:11.86,7:29.46,8:84.01,9:164.8,10:248.1}
name={2:'Mercury',3:'Venus',4:'Earth',5:'Mars',6:'Jupiter',7:'Saturn',8:'Uranus',9:'Neptune',10:'Pluto'}
bad=0; seen=set()
for l in open('out/sistemasolar/periodo.dat'):
    if not l.strip(): continue
    u,d=l.split(); u=int(u); yr=float(d)/365.25; seen.add(u)
    e=abs(yr-real[u])/real[u]; tol=0.15 if u==2 else 0.05
    print(f"  {'PASS' if e<tol else 'FAIL'}  {name[u]:<10} period {yr:9.3f} yr   real {real[u]:7.3f}   {e*100:4.1f}%")
    bad+= e>=tol
miss=set(real)-seen
if miss: print("  FAIL  no period for:", ", ".join(name[u] for u in sorted(miss))); bad+=1
raise SystemExit(1 if bad else 0)
PY
[ $rc -eq 0 ] && pass=$((pass+1)) || fail=$((fail+1))
run velocidades "" 600
python3 - <<'PY'; rc=$?
# perihelion speeds, m/s
real={2:58980,3:35260,4:30290,5:26500,6:13720,7:10180,8:7110,9:5470,10:6100}
name={2:'Mercury',3:'Venus',4:'Earth',5:'Mars',6:'Jupiter',7:'Saturn',8:'Uranus',9:'Neptune',10:'Pluto'}
bad=0
import re
for l in open('out/velocidades/velocidades.dat'):
    m=re.search(r'R\(\s*(\d+)\s*,\)=\s*([-\dEe.+]+)',l)
    if not m: continue
    u=int(m.group(1)); v=float(m.group(2))
    if u not in real: continue
    e=abs(v-real[u])/real[u]
    print(f"  {'PASS' if e<0.02 else 'FAIL'}  {name[u]:<10} v_peri {v:9.1f} m/s  real {real[u]:7d}   {e*100:4.1f}%")
    bad+= e>=0.02
raise SystemExit(1 if bad else 0)
PY
[ $rc -eq 0 ] && pass=$((pass+1)) || fail=$((fail+1))

echo
echo "  $pass passed, $fail failed"
exit $([ $fail -eq 0 ] && echo 0 || echo 1)
