#!/usr/bin/env bash
# Compile every coursework program. Each .cpp and .f is a standalone program,
# except cpp/projects/*, where a .hpp marks a multi-file project.
set -u
R="$(cd "$(dirname "$0")" && pwd)"; cd "$R"
OUT="${1:-bin}"; mkdir -p "$OUT"
ok=0; fail=0
build(){ if "$@" 2>/tmp/cwerr; then ok=$((ok+1)); else fail=$((fail+1)); echo "  FAIL: $2"; sed 's/^/      /' /tmp/cwerr | head -3; fi; }

for d in cpp/projects/*/; do
  name=$(basename "$d")
  if ls "$d"*.hpp >/dev/null 2>&1; then                 # multi-file project
    build g++ -std=gnu++14 -w -I"$d" "$d"main.cpp $(ls "$d"*.cpp | grep -v 'main.cpp') -o "$OUT/$name"
  else
    for f in "$d"*.cpp; do build g++ -std=gnu++14 -w "$f" -o "$OUT/$name-$(basename "${f%.cpp}")"; done
  fi
done
for f in $(find cpp/labs -name '*.cpp'); do
  build g++ -std=gnu++14 -w "$f" -o "$OUT/$(basename "$(dirname "$f")")-$(basename "${f%.cpp}")"
done
for f in $(find fortran -name '*.f'); do
  build gfortran -ffixed-form -ffixed-line-length-none -std=legacy -w "$f" -o "$OUT/$(basename "$(dirname "$f")")-$(basename "${f%.f}")"
done
echo "  $ok built, $fail failed"
exit $([ $fail -eq 0 ] && echo 0 || echo 1)
