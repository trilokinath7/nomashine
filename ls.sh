#!/bin/bash

total_duration=100
interval=10
iterations=$((total_duration / interval))
for ((i=1; i<=iterations; i++)); do
    echo "Run $i: Executing 'ls' command"
    ls
    if [ $i -lt $iterations ]; then
        sleep $interval
    fi
done
echo "Finished running 'ls' every $interval seconds for $total_duration seconds."
