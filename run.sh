#!/bin/bash
if [[ -z "$1" ]]; then
    echo 'Please, specify directory'
    exit
fi

cd $1
make -s -f ../Makefile && ./main
