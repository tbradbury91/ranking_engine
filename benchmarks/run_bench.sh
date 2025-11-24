#!/usr/bin/env bash
set -euo pipefail
BINARY=./ranking_engine
if [ ! -x "$BINARY" ]; then
  echo "Binary not found. Build first with cmake && make in ./build"
  exit 1
fi

N=100
echo "Running $N pipeline runs and timing..."
START=$(date +%s%3N)
for i in $(seq 1 $N); do
  $BINARY >/dev/null
done
END=$(date +%s%3N)
DUR_MS=$((END-START))
AVG_MS=$(echo "scale=2; $DUR_MS / $N" | bc)
echo "Total time (ms): $DUR_MS"
echo "Avg per run (ms): $AVG_MS"
