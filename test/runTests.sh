#!/bin/bash

printf "\n\nRunning Tests for VMC/GFMC\n"
printf "======================================================\n"

MPICOMMAND="mpirun -np 4"
VMCPATH="../../bin/VMC vmc.dat"
CIPATH="../../bin/VMC ci.dat"
GFMCPATH="../../bin/GFMC gfmc.dat"
here=`pwd`
tol=1.0e-7
clean=0

# VMC tests

cd $here/hubbard_1x14
../clean.sh
printf "...running hubbard_1x14\n"
$MPICOMMAND $VMCPATH > vmc.out
python ../testEnergy.py 'vmc' $tol
$MPICOMMAND $CIPATH > ci.out
python ../testEnergy.py 'ci' $tol
if [ $clean == 1 ]
then    
    ../clean.sh
fi

cd $here/hubbard_1x22
../clean.sh
printf "...running hubbard_1x22\n"
$MPICOMMAND $VMCPATH > vmc.out
python ../testEnergy.py 'vmc' $tol
if [ $clean == 1 ]
then    
    ../clean.sh
fi

cd $here/hubbard_1x50
../clean.sh
printf "...running hubbard_1x50\n"
$MPICOMMAND $VMCPATH > vmc.out
python ../testEnergy.py 'vmc' $tol
if [ $clean == 1 ]
then    
    ../clean.sh
fi

cd $here/hubbard_1x6
../clean.sh
printf "...running hubbard_1x6\n"
$VMCPATH > vmc.out
python ../testEnergy.py 'vmc' $tol
if [ $clean == 1 ]
then    
    ../clean.sh
fi

cd $here/hubbard_18_tilt/
../clean.sh
printf "...running hubbard_18_tilt uhf\n"
$MPICOMMAND $VMCPATH > vmc.out
python ../testEnergy.py 'vmc' $tol
printf "...running hubbard_18_tilt gfmc\n"
$MPICOMMAND $GFMCPATH > gfmc.out
python ../testEnergy.py 'gfmc' $tol
if [ $clean == 1 ]
then    
    ../clean.sh
fi

cd $here/h6/
../clean.sh
printf "...running h6\n"
$MPICOMMAND $VMCPATH > vmc.out
python ../testEnergy.py 'vmc' $tol
if [ $clean == 1 ]
then    
    ../clean.sh
fi

cd $here/h20/
../clean.sh
printf "...running h20\n"
$MPICOMMAND $VMCPATH > vmc.out
python ../testEnergy.py 'vmc' $tol
if [ $clean == 1 ]
then    
    ../clean.sh
fi

cd $here/c2/
../clean.sh
printf "...running c2\n"
$MPICOMMAND $VMCPATH > vmc.out
python ../testEnergy.py 'vmc' $tol
if [ $clean == 1 ]
then    
    ../clean.sh
fi

cd $here