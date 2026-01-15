#!/bin/bash
script_abs=$(readlink -f "$0")
script_dir=$(dirname $script_abs)
#of5x
#decomposePar
#mpirun -np 20 MTO_TF_PIMPLE_PARALLEL -parallel > log.out 2>&1 &
#mpirun -np 20 MTO_TF_PIMPLE_PARALLEL -parallel | tee log.out
echo "The end time is :"
read endtime
echo "The number of iteration is :"
read itenumb

for i in $(seq 1 $itenumb)
do
	cp -r $script_dir/constant $script_dir/$i/
   	cp -r $script_dir/system $script_dir/$i/

	for j in $(seq 0 19)
	do
		cp -r $script_dir/processor$j/constant $script_dir/$i/processor$j/
	done

	cd $script_dir/$i/
	reconstructPar
	for j in $(seq 0 19)
	do
		rm -r $script_dir/$i/processor$j
	done
	cp -r $script_dir/$i/$endtime/fsens $script_dir/$i
	cp -r $script_dir/$i/$endtime/gamma $script_dir/$i
	cp -r $script_dir/$i/$endtime/gsens_U $script_dir/$i
done


