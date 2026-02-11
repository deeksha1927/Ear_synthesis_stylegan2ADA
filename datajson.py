import os
import json

def create_dataset_json(base_path):
    dataset = {"labels": []}

    # Traverse the base directory
    for folder_name in sorted(os.listdir(base_path)):
        folder_path = os.path.join(base_path, folder_name)

        if os.path.isdir(folder_path) and folder_name.isdigit():  # Check if folder name is numeric
            index = int(folder_name)-1 # Extract the index from folder name
            for image_name in sorted(os.listdir(folder_path)):
               dataset["labels"].append([os.path.join(folder_name, image_name), index])

    # Save to dataset.json
    with open('dataset.json', 'w') as json_file:
        json.dump(dataset, json_file, indent=4)

# Specify the base path
base_path = '/store01/flynn/darun/uerc2023/data/public/'
create_dataset_json(base_path)

