### EYE Image Synthesis

## Obtaining the Trained Model Weights
The trained model weights can be downloaded at [network-snapshot-025000.pkl](https://drive.google.com/drive/folders/16IgnUHyMQpotSMyCyJJJNJTCpt7c2DGe?usp=share_link).

## Contents
- **Training Dataset Preparation:**
  - Code: stylegan2-ada-pytorch-code/dataset_tool.py
  - *Note: To prepare the conditional training dataset, ensure you have a JSON file containing filenames and their corresponding labels. An example JSON file is available in training-dataset/dataset.json.*

- **Training:**
  - Code: stylegan2-ada-pytorch-code/train.py

- **Synthesis Image Generation:**
  - Code: stylegan2-ada-pytorch-code/generate.py
  - *Note: If you want to adjust the noise intensity while generating synthesis images, you can change it by modifying line number 122.*
 
## Create Environment
Set up Python environment using Conda:

``
conda env create -f environment.yml
``

## To Run
1.) Run the following bash script to prepare the training dataset and train the model:

``
./train.sh
``

2.) Run the following bash script to generate synthesis images with different noise intensities:

``
./generate.sh
``

***Note: Make sure you have provided all the valid paths in the script.***


