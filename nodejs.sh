#!/bin/bash
export LANG="en_US.UTF-8"
#export NODE_OPTIONS='--trace-gc --trace-gc-ignore-scavenger --max-old-space-size=2048000 --initial-old-space-size=2048000 --no-global-gc-scheduling --no-incremental-marking --max-semi-space-size=1024 --initial-heap-size=2048000'
#export NODE_OPTIONS='--max-old-space-size=2048000 --initial-old-space-size=2048000 --no-global-gc-scheduling --max-semi-space-size=1024 --initial-heap-size=2048000'
node -e 'console.log(`node heap limit = ${require("v8").getHeapStatistics().heap_size_limit / (1024 * 1024)} Mb`)'
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
