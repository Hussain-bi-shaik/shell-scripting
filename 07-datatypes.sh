#!/bin/bash
NUMBER1=$1
NUMBER2=$2
TIMESTAMP=$(date)
echo "script execueted at : $TIMESTAMP"
SUM=$(($NUMBER1+$NUMBER2))
echo "the sum is $SUM"