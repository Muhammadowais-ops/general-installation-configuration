#!/bin/bash

a=10

[[ $a -gt 11 ]] && echo "nope" || echo "else"


echo "hey" && [[ $a == 10 ]] || echo "ne"
