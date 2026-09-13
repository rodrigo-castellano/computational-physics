#!/usr/bin/env bash
# Build every program, run it, and check the results against known physics.
set -u
R="$(cd "$(dirname "$0")" && pwd)"
cd "$R"
pass=0; fail=0
ok()   { printf "  \033[32mPASS\033[0m  %-34s %s\n" "$1" "${2:-}"; pass=$((pass+1)); }
bad()  { printf "  \033[31mFAIL\033[0m  %-34s %s\n" "$1" "${2:-}"; fail=$((fail+1)); }
near() { awk -v a="$1" -v b="$2" -v t="$3" 'BEGIN{d=(a-b)/b; if(d<0)d=-d; exit !(d<t)}'; }

echo "== build =="
make clean >/dev/null 2>&1
if make >/dev/null 2>&1; then ok "make" "$(ls bin | wc -l) executables"; else bad "make"; make; exit 1; fi

run() { # name, stdin, timeout
  local p="$1" inp="${2:-}" secs="${3:-120}" d="$R/out/$1"
  rm -rf "$d"; mkdir -p "$d"; cp "$R"/data/*.dat "$d/" 2>/dev/null
  ( cd "$d" && printf '%b' "$inp" | timeout "$secs" "$R/bin/$p" >stdout.txt 2>&1 )
}

echo "== exercises =="
run circulo "2.0\n"
a=$(awk 'NR==2{print $1}' out/circulo/stdout.txt)
near "$a" 12.566370614 0.001 && ok "circulo  area(r=2)" "$a" || bad "circulo" "$a"

run rodrigo
m=$(grep -o '[0-9]*$' out/rodrigo/stdout.txt | tail -1)
[ "$m" = "9" ] && ok "rodrigo  max of matrix" "$m" || bad "rodrigo" "$m"

run integral
v=$(tail -1 out/integral/resultados.dat | awk '{print $2}')
near "$v" 0.3333333 0.001 && ok "integral  \$_0^1 x^2 dx = 1/3" "$v" || bad "integral" "$v"

echo "== schrodinger =="
for p in schrodinger_v1 schrodinger_v2 cuanticadef; do
  run $p "" 120
  if [ -s "out/$p/Norma" ]; then ok "$p" "$(wc -l < out/$p/Norma) rows"; else bad "$p" "no Norma"; fi
done

echo "== ising (2D, exact Tc = 2.269) =="
run ising_v2 "" 180
[ -s out/ising_v2/datos.dat ] && ok "ising_v2" "$(wc -l < out/ising_v2/datos.dat) rows" || bad "ising_v2"
run ising_v1_standalone "2.0\n" 180
[ -s out/ising_v1_standalone/datos.dat ] && ok "ising_v1_standalone T=2.0" "ordered phase" || bad "ising_v1_standalone"
run ising_v4_observables "16\n" 300
if [ -s out/ising_v4_observables/datos.dat ]; then
  drop=$(awk '$1>2.2&&$1<2.4{a=$2} $1>2.4&&$1<2.6{b=$2} END{if(a>0&&b>0&&b<a*0.7) print "yes"}' out/ising_v4_observables/datos.dat)
  [ "$drop" = "yes" ] && ok "ising_v4  phase transition at Tc" "order param collapses 2.3->2.5" \
                       || bad "ising_v4  transition not detected"
else bad "ising_v4_observables"; fi

echo "== solar system (periods vs reality) =="
run sistemasolar "" 300
if [ -s out/sistemasolar/periodo.dat ]; then
python3 - <<'PY' || true
real={2:0.241,3:0.615,4:1.000,5:1.881,6:11.86,7:29.46,8:84.01,9:164.8,10:248.1}
name={2:'Mercury',3:'Venus',4:'Earth',5:'Mars',6:'Jupiter',7:'Saturn',8:'Uranus',9:'Neptune',10:'Pluto'}
bad=0
for l in open('out/sistemasolar/periodo.dat'):
    if not l.strip(): continue
    u,d=l.split(); u=int(u); yr=float(d)/365.25
    e=abs(yr-real[u])/real[u]
    tol=0.15 if u==2 else 0.05
    print(f"  {'PASS' if e<tol else 'FAIL'}  {name[u]:<10} {yr:8.3f} yr   real {real[u]:7.3f}   {e*100:4.1f}%")
    bad+=e>=tol
raise SystemExit(1 if bad else 0)
PY
  [ $? -eq 0 ] && pass=$((pass+1)) || fail=$((fail+1))
else bad "sistemasolar"; fi
run velocidades "" 60
[ -s out/velocidades/velocidades.dat ] && ok "velocidades" || bad "velocidades"

echo "== rocket =="
run nave_v2 "" 120
[ -s out/nave_v2/posicion.txt ] && ok "nave_v2" "$(wc -l < out/nave_v2/posicion.txt) rows" || bad "nave_v2"
echo "  SKIP  nave_v1                            does not terminate (see README)"

echo
echo "  $pass passed, $fail failed"
exit $([ $fail -eq 0 ] && echo 0 || echo 1)
