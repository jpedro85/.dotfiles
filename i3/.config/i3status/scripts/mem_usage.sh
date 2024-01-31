#!/bin/bash

read total used free shared buff_cache available < <(free | awk '/Mem:/ {print $2 " " $3 " " $4 " " $5 " " $6 " " $7}')

# Calculate used memory including buffers and cache
used_with_cache=$((used + shared))

# Convert the used memory to GiB
used_with_cache_gib=$(echo "scale=2; $used_with_cache / 1024 / 1024" | bc)

echo "MEM: $used_with_cache_gib GiB"
