#!/bin/bash
let number=$RANDOM
if [ $number -gt 2500 ]
then
  echo "What is your favorite topic?"
else
  echo "What is your favorit movie?"
fi
read $REPLY
