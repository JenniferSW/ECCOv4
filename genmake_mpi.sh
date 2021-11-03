#! /usr/bin/env bash

# Written:     2013-10-15
# Last change: 2014-02-11

experiment="ECCOv4"

cd build_ecco

/home/jwesselbaum/MITgcm/tools/genmake2 -rootdir=/home/jwesselbaum/MITgcm \
-mods=/home/jwesselbaum/MITgcm/mysetups/$experiment/code \
-mpi \
-of \
/home/jwesselbaum/MITgcm/tools/build_options/linux_amd64_gfortran_mpi

make depend
make -j 4 
