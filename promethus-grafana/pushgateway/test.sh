#!/bin/bash

# Get the current CPU usage
CPU_USAGE=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2}')
job=letme
provider=tesing
instance=keye
metric=my_test_cpu
echo "$metric $CPU_USAGE" | curl --data-binary @- http://localhost:9092/metrics/job/$job/instance/$instance/provider/$provider

