#!/bin/bash
script_abs=$(readlink -f "$0")
script_dir=$(dirname $script_abs)

	cp -r $script_dir/../constant $script_dir/
   	cp -r $script_dir/../system $script_dir/
	for j in $(seq 0 19)
	do
		cp -r $script_dir/../processor$j/constant $script_dir/processor$j/
		cp -r $script_dir/processor$j/Opt $script_dir/processor$j/1.1
	done


