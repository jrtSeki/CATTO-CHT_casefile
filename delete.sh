#!/bin/bash
script_abs=$(readlink -f "$0")
script_dir=$(dirname $script_abs)
#filename="2e-3t500_alpha0.1"
#of5x
#mpirun -np 20 MTO_TF_PIMPLE_PARALLEL -parallel
echo "The end time is :"
read endtime
echo "The number of iteration is :"
read itenumb
for i in $(seq 1 $itenumb)
do
	rm -r $script_dir/$i
done



