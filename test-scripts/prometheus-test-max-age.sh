echo "====================================="

MIN_TIME=$(curl -s http://localhost:9090/api/v1/status/tsdb | jq '.data.headStats.minTime? / 1000')

echo "Min block time: $MIN_TIME"

date -d @"$MIN_TIME"

echo "====================================="

DIFF_IN_H=$(curl -s http://localhost:9090/api/v1/status/tsdb | jq '(.data.headStats.maxTime? - .data.headStats.minTime?) / 1000 / 60 / 60')

echo "Time diff: $DIFF_IN_H h"

echo "====================================="