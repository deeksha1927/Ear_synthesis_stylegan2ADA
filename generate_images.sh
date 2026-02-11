#!/bin/bash
#$ -q gpu                          # Run on the GPU cluster
#$ -l h=qa-a10-*|qa-l40s-*          # GPU hosts
#$ -l gpu_card=1                   # Run on 1 GPU card

conda activate /afs/crc/user/d/darun/.conda/envs/styleg
module load cuda/12.1

export TORCH_EXTENSIONS_DIR=$TMPDIR/torch_extensions
mkdir -p "$TORCH_EXTENSIONS_DIR"

NETWORK="/store01/flynn/darun/earsyn_output/00000-dataset-cond-auto4/network-snapshot-025000.pkl"
BASE_OUTDIR="/store01/flynn/darun/stylegan_generated"
SEEDS="0-50"

# Generate for classes 1..1310, with outdir BASE_OUTDIR/0001 ... /1310
for cls in $(seq 0 1); do
  printf -v cls_dir "%04d" "$cls"              # 0001, 0002, ..., 1310
  outdir="${BASE_OUTDIR}/${cls_dir}"
  mkdir -p "$outdir"

  python /users/darun/afs/Forensic-Iris-Image-Synthesis/stylegan2-ada-pytorch-code/generate_from_z.py \
    --network="$NETWORK" \
    --seeds="$SEEDS" \
    --outdir="$outdir" \
    --class="$cls"
done


