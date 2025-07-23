import os

# Input and output folders
input_folder = "kas.training_txt"
output_folder = "wordlist"

# Create output folder if it doesn't exist
os.makedirs(output_folder, exist_ok=True)

# Loop through each file in input folder
for filename in os.listdir(input_folder):
    input_path = os.path.join(input_folder, filename)
    output_path = os.path.join(output_folder, filename)

    # Only process text files (skip folders)
    if os.path.isfile(input_path):
        with open(input_path, 'r', encoding='utf-8') as infile, \
             open(output_path, 'w', encoding='utf-8') as outfile:

            for line in infile:
                words = line.strip().split()
                for word in words:
                    outfile.write(word + '\n')

        print(f"✅ Processed: {filename} → {output_path}")
