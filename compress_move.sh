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
#echo "New File name is :"
#read filename
mkdir $script_dir/total
for i in $(seq 1 $itenumb)
do
	mkdir $script_dir/total/$i
        cp $script_dir/$i/$endtime/fsens $script_dir/total/$i/
	cp $script_dir/$i/$endtime/gsens_U $script_dir/total/$i/
	cp $script_dir/$i/$endtime/gamma $script_dir/total/$i/	
done
cp -r $script_dir/system $script_dir/total/
cp -r $script_dir/constant $script_dir/total/
tar -zcvf $endtime.tar.gz $script_dir/.


