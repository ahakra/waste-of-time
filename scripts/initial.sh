script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
touch "$script_dir/file-001.txt"
echo "File created: $script_dir/file-001.txt"
echo "Script executed successfully." > "$script_dir/file-001.txt"
echo "ahmad" >> "$script_dir/file-001.txt"
echo "akra" >> "$script_dir/file-001.txt"
echo "bash" >> "$script_dir/file-001.txt"

## ?(cat|dog)   # matches: empty, cat, dog
## *(cat|dog)   # matches: empty, cat, dog, catdog, catcat, ...
## +(cat|dog)   # matches: cat, dog, catdog, catcat, ...
## @(cat|dog)   # matches: cat or dog
## !(cat|dog)   # matches anything except exactly cat or dog