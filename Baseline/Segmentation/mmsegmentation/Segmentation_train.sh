#!/bin/bash
#PBS -l select=1:ncpus=8:ngpus=1
#PBS -q ee

############### 1. modify the name of vir-env
source activate b06901053_mmseg
cd $PBS_O_WORKDIR
module load cuda/cuda-9.2/x86_64

######################
CONFIG_FILE=configs/densecl/fcn_r50-d8_512x512_20k_voc12aug.py
GPUS=4
# 2. Change the output dir 3. Change the path of pretrained model in fcn_r50-d8.py
OUTPUT_DIR=logs/DenseCL
CHECKPOINT_FILE=../Models/DenseCL.pth
./tools/dist_train.sh ${CONFIG_FILE} ${GPUS} --work-dir ${OUTPUT_DIR} 
###


conda deactivate
