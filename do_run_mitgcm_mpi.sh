#!/bin/bash

WORKDIR=$(pwd)

echo "# Locating needed directories"

if [ ! -d "build" ]; then

  echo "= Directories not found!"
  echo "> Go to parent directory"

  WORKDIR="$WORKDIR/.."
  cd $WORKDIR

  if [ ! -d "build" ]; then
    exit 1
  fi
fi


echo "= Required directory found."
echo "= Working now in $(pwd)"



if [ ! -d $run ]; then
 echo "= run directory not found!"
 echo "ABNORMAL END"
 exit 1
fi

#if [ ! -d $inpdir ]; then
# echo "= input directory not found!"
# echo "ABNORMAL END"
# exit 1
#fi


#
# Link input and build artifact
#

echo "> Link inputs and artifacts"
cd run_ecco

ln -s ../build/mitgcmuv .
ln -s ../input_ecco/* .
ln -s ../inputs_baseline2/input*/* .
ln -s ../forcing_baseline2 .


echo "= Links created"
echo "> Run model"


time mpirun -np 24 ./mitgcmuv > output.txt

echo "= Run finished"

