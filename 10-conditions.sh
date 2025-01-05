#!/bin/bash
NUMBER=$1       # $1 indicates that we are giving the values at runtime
if [ $NUMBER -ge 100 ]     
 then 
    echo "the given number is greter than 100"
else
    echo "the given number is less than are equal to 100"
fi    

### in shell script we dont use <,> symbols, we use thebelow symbols for the expressions
## > -- -ge; <-- -le; =-- -eq; >=-- -ge; <= -- -le
