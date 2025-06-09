#!/bin/bash

echo "Do you know me?"
read -p "Answer is " Answer

case "$Answer" in
  yes|YES|y|Y)
    echo "True"
    ;;
  no|NO|n|N)
    echo "False"
    ;;
  *)
    echo "Invalid answer"
    ;;
esac
