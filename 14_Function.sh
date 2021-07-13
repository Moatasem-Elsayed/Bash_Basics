#!/bin/bash

DisplayHello()
{
echo "Hello Function"
}

DisplayHello

DisplayHelloArgument(){
echo $1 $2 $3
}

DisplayHelloArgument "hello" "world" "EgyPT"	
