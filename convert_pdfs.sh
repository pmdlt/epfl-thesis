#!/bin/bash

# Script to convert PDF files to version 1.5 to resolve xdvipdfmx warnings
# This will backup original files with .backup extension and convert in place

echo "Converting PDF files to version 1.5..."

# Function to convert a single PDF file
convert_pdf() {
    local file="$1"
    local backup_file="${file}.backup"
    
    # Check if file exists and is a PDF
    if [[ -f "$file" && "$file" == *.pdf ]]; then
        echo "Processing: $file"
        
        # Create backup
        cp "$file" "$backup_file"
        
        # Convert to PDF 1.5
        gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.5 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$file.tmp" "$file"
        
        # Check if conversion was successful
        if [[ $? -eq 0 && -f "$file.tmp" ]]; then
            mv "$file.tmp" "$file"
            echo "  ✓ Converted successfully (backup: $backup_file)"
        else
            echo "  ✗ Conversion failed for $file"
            # Remove temporary file if it exists
            [[ -f "$file.tmp" ]] && rm "$file.tmp"
            # Remove backup since conversion failed
            [[ -f "$backup_file" ]] && rm "$backup_file"
        fi
    fi
}

# Convert PDFs in Theme directory
echo "Converting PDFs in Figures/Theme/..."
for pdf in /workspaces/epfl-thesis/Figures/Theme/*.pdf; do
    convert_pdf "$pdf"
done

# Convert PDFs in Logotypes directory
echo "Converting PDFs in Figures/Theme/Logotypes/..."
for pdf in /workspaces/epfl-thesis/Figures/Theme/Logotypes/*.pdf; do
    convert_pdf "$pdf"
done

echo "Conversion complete!"
echo "Original files have been backed up with .backup extension"
echo "If everything works correctly, you can remove the backup files with:"
echo "find /workspaces/epfl-thesis/Figures/Theme -name '*.backup' -delete"
