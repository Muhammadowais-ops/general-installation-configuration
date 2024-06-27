#!/bin/bash

declare -A myar

myar=( [name]="hellow" [dic]=30 )

echo "${myar[name]}"
