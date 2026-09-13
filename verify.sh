#!/usr/bin/env bash
# Build every simulation, run it, and check its output against known physics.
set -u
R="$(cd "$(dirname "$0")" && pwd)"; cd "$R"
pass=0; fail=0
ok(){ printf "  \033[32mPASS\033[0m  %-16s %s\n" "$1" "${2:-}"; pass=$((pass+1)); }
no(){ printf "  \033[31mFAIL\033[0m  %-16s %s\n" "$1" "${2:-}"; fail=$((fail+1)); }
run(){ local p=$1 inp=${2:-} s=${3:-900} d="$R/out/$1"
  rm -rf "$d"; mkdir -p "$d"
  ( cd "$d" && printf '%b' "$inp" | timeout "$s" "$R/bin/$p" >stdout.txt 2>&1 ); }
drift(){ awk '{v=$NF+0; if(NR==1){mn=v;mx=v;f=v} if(v<mn)mn=v; if(v>mx)mx=v}
  END{b=(f<0?-f:f); if(b==0)b=1; printf "%.2e", (mx-mn)/b}' "$1"; }

echo "build"
make clean >/dev/null 2>&1
make >/dev/null 2>&1 && ok "make" "$(ls bin|wc -l) executables" || { no "make"; make; exit 1; }

echo "ising  -- exact Tc = 2/ln(1+sqrt2) = 2.269"
run ising "16\n"
t=$(awk '$1>2.2&&$1<2.4{a=$2} $1>2.4&&$1<2.6{b=$2} END{if(a>0&&b>0&&b<a*0.7)print "y"}' out/ising/datos.dat)
[ "$t" = y ] && ok "ising" "order parameter collapses across Tc" || no "ising" "no transition found"

echo "schrodinger  -- Crank-Nicolson is unitary, so the norm is conserved"
run schrodinger
d=$(drift out/schrodinger/Norma)
awk -v d="$d" 'BEGIN{exit !(d<1e-9)}' && ok "schrodinger" "norm drift $d over 2800 steps" || no "schrodinger" "norm drift $d"

echo "rocket  -- the Hamiltonian is conserved"
run nave
d=$(drift out/nave/ch.txt)
awk -v d="$d" 'BEGIN{exit !(d<1e-6)}' && ok "nave" "Hamiltonian drift $d" || no "nave" "$d"

echo "solar system  -- against the real one"
run sistemasolar
python3 - <<'PY'; rc=$?
real={2:0.241,3:0.615,4:1.000,5:1.881,6:11.86,7:29.46,8:84.01,9:164.8,10:248.1}
name={2:'Mercury',3:'Venus',4:'Earth',5:'Mars',6:'Jupiter',7:'Saturn',8:'Uranus',9:'Neptune',10:'Pluto'}
bad=0; seen=set()
for l in open('out/sistemasolar/periodo.dat'):
    if not l.strip(): continue
    u,d=l.split(); u=int(u); yr=float(d)/365.25; seen.add(u)
    e=abs(yr-real[u])/real[u]; tol=0.15 if u==2 else 0.05
    print(f"  {'PASS' if e<tol else 'FAIL'}  {name[u]:<10} {yr:9.3f} yr   actual {real[u]:7.3f}   {e*100:4.1f}%")
    bad+= e>=tol
if set(real)-seen: print("  FAIL  missing periods"); bad+=1
raise SystemExit(1 if bad else 0)
PY
[ $rc -eq 0 ] && pass=$((pass+1)) || fail=$((fail+1))
run velocidades
python3 - <<'PY'; rc=$?
import re
real={2:58980,3:35260,4:30290,5:26500,6:13720,7:10180,8:7110,9:5470,10:6100}
name={2:'Mercury',3:'Venus',4:'Earth',5:'Mars',6:'Jupiter',7:'Saturn',8:'Uranus',9:'Neptune',10:'Pluto'}
bad=0
for l in open('out/velocidades/velocidades.dat'):
    m=re.search(r'R\(\s*(\d+)\s*,\)=\s*([-\dEe.+]+)',l)
    if not m: continue
    u=int(m.group(1)); v=float(m.group(2))
    if u not in real: continue
    e=abs(v-real[u])/real[u]
    print(f"  {'PASS' if e<0.02 else 'FAIL'}  {name[u]:<10} {v:9.1f} m/s  actual {real[u]:7d}   {e*100:4.1f}%")
    bad+= e>=0.02
raise SystemExit(1 if bad else 0)
PY
[ $rc -eq 0 ] && pass=$((pass+1)) || fail=$((fail+1))

echo
echo "  $pass passed, $fail failed"
exit $([ $fail -eq 0 ] && echo 0 || echo 1)
