#!/bin/sh

set -e # exit this script upon error

mkdir -p bin_out

nasm -f elf32 -o $1.o $1.asm 
ld -m elf_i386 $1.o -o bin_out/$1
rm $1.o

set +e # do not exit on error

./bin_out/$1
echo "Exited with code: $?"
