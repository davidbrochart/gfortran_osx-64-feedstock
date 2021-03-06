#!/bin/bash

$FC -o hello hello.f90 -v
./hello

$FC -o hello hello.f90 ${LDFLAGS} -v
./hello

$FC -o hello ${FFLAGS} hello.f90 -v
./hello

$FC -o hello ${FFLAGS} hello.f90 ${LDFLAGS} -v
./hello

rm -f hello

$FC -O3 -fopenmp -ffast-math -o maths maths.f90 -v
./maths
rm -f maths

$FC -c print_hello.f90 -o print_hello.o
clang++ -c main.cpp -o main.o
clang++ main.o print_hello.o -o main -lgfortran
rm print_hello.o main.o main

if [[ ! $FFLAGS ]]
then
    exit 1
fi

if [[ ! $LDFLAGS ]]
then
    exit 1
fi
