import os

def split_single_line_file(input_file, chars_per_file, output_dir="kas1.training_txt"):
    # Create output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)

    with open(input_file, 'r', encoding='utf-8') as file:
        text = file.read().strip()

    total_length = len(text)
    file_count = 0

    for i in range(0, total_length, chars_per_file):
        file_count += 1
        part = text[i:i + chars_per_file]
        output_filename = os.path.join(output_dir, f'kas.training{file_count}_text')
        with open(output_filename, 'w', encoding='utf-8') as outfile:
            outfile.write(part)
        print(f'✅ Created {output_filename} with characters {i+1} to {min(i + chars_per_file, total_length)}')

# Example usage:
split_single_line_file("kas.training2_text", 100)
