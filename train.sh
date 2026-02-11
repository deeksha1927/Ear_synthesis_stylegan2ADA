#!/bin/bash
#$ -q gpu                          # Run on the GPU cluster
#$ -l h=qa-a10-*
#$ -l gpu_card=4                   # Run on 4 GPU card

source activate /afs/crc/user/d/darun/.conda/envs/styleg
module load cuda/12.1

# Input image size
imsize=128

# Raw data input directory
input_dir="/store01/flynn/darun/uerc2023/data/public/"

# Processed data output directory
processed_dir="/store01/flynn/darun/earsyn_output/dataset.zip"

# Training output directory
trained_dir="/store01/flynn/darun/earsyn_output/"

# Source code directory
source_code="/users/darun/afs/Forensic-Iris-Image-Synthesis/stylegan2-ada-pytorch-code/"

# Preprocess your custom dataset by running dataset_tool.py
#python3 ''$source_code'dataset_tool.py' --source=$input_dir --dest=$processed_dir --width=$imsize --height=$imsize

# Train your custom dataset by running train.py
python3 ''$source_code'train.py' --data=$processed_dir --outdir=$trained_dir --cond=1 --gpus=4
