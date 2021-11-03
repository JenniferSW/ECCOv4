#!/bin/bash

WORKDIR=$(pwd)
BUILDDIR="build"
INPUTDIR="input"
RUNDIR="run"


echo "# Locating needed directories"

if [ ! -d "$BUILDDIR/" ]; then

  echo "= Directories not found!"
  echo "> Go to parent directory"

  WORKDIR="$WORKDIR/.."
  cd $WORKDIR

  if [ ! -d "$BUILDDIR/" ]; then
    exit 1
  fi
fi


echo "= Required directory found."
echo "= Working now in $(pwd)"



if [ ! -d "$RUNDIR/" ]; then
 echo "= run directory not found!"
 echo "ABNORMAL END"
 exit 1
fi

if [ ! -d "$INPUTDIR/" ]; then
 echo "= input directory not found!"
 echo "ABNORMAL END"
 exit 1
fi


#
# Link input and build artifact
#
cd $RUNDIR
echo "> changed to $(pwd) "


echo "> Link inputs and artifacts"
ln -s ../$BUILDDIR/mitgcmuv .
ln -s ../$INPUTDIR/* .
ln -s ../inputs_baseline2/input*/* .
ln -s ../forcing_baseline2 .


echo "= Links created"
echo "> Run model"


time mpirun -np 24 ./mitgcmuv > output.txt

echo "= Run finished"
echo "build directory $BUILDDIR"
echo "input directory $INPUTDIR"
echo "run directory $RUNDIR"

