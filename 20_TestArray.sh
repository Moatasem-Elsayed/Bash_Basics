#!/bin/bash

#declare -a arr=(BMW MERCEDES TOTYTA)
arr=(BMW MERCEDESE TOTYTA)
echo ${arr[1]}

declare -A  login=([user]=Moatsem [password]=password)
echo ${login[user]}
echo ${login[password]}
