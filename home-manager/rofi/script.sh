# Specify the directory containing the files
DIR="./files"

# Create or clear the output config file
OUTPUT_CONFIG="default.nix"
echo "{ config, pkgs, ... }:" > "$OUTPUT_CONFIG"
echo "" >> "$OUTPUT_CONFIG"
echo "{" >> "$OUTPUT_CONFIG"

# Iterate over files in the specified directory
find "$DIR" -type f | while read -r file; do
    # Get the path relative to the home directory for the config
    REL_PATH="${file#$DIR/}" # Remove the directory part from the path
    CONFIG_PATH=".config/$REL_PATH" # Prepend .config to the relative path

    # Read the file content and escape single quotes
    CONTENT=$(<"$file")
    ESCAPED_CONTENT="${CONTENT//\'/\'\\\'\'}" # Escape single quotes for Nix

    # Write the configuration entry to the output file
    echo "  home.file.\"$CONFIG_PATH\".text = ''$ESCAPED_CONTENT'';" >> "$OUTPUT_CONFIG"
done

# Close the configuration block
echo "}" >> "$OUTPUT_CONFIG"

echo "Home Manager configuration has been generated in $OUTPUT_CONFIG."

