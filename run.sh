#!/bin/bash
script_abs=$(readlink -f "$0")
script_dir=$(dirname $script_abs)
#of5x
blockMesh
decomposePar
mpirun -np 20 MTO_TF_PIMPLE_PARALLEL_hePDE_Final -parallel | tee log.out
