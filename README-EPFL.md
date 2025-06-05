# EPFL Thesis Template

This document describes the customization of the IPLeiria thesis template for École Polytechnique Fédérale de Lausanne (EPFL).

## Quick Start

To use the EPFL version:

1. Open `IPLeiriaMain.tex`
2. Set `school=epfl` in the document class options (already configured)
3. Compile with pdfLaTeX: `pdflatex IPLeiriaMain.tex`
4. Run additional passes if needed for references: `pdflatex IPLeiriaMain.tex`

## Status: ✅ COMPLETE

The EPFL thesis template has been successfully implemented and tested. All EPFL branding elements are working correctly with pdfLaTeX compilation.

## EPFL Customizations Implemented

### 1. School Option
- Added 'epfl' as a school choice in `IPLeiriaThesis.cls`
- Enables EPFL-specific branding throughout the document

### 2. Colors (Configurations/01-Colors.sty)
- **epflred**: Primary EPFL red (#FF0000)
- **epflgray**: EPFL dark gray (#373A36) 
- **epfllightgray**: EPFL light gray (#E5E5E5)
- Updated link colors to use EPFL red

### 3. Logos and Graphics
- **EPFL Logos**: Located in `Figures/Theme/Logotypes/`
  - `EPFL_Logo_Digital_WHITE_PROD.png` (for dark backgrounds)
  - `EPFL_Logo_Digital_BLACK_PROD.png` (for light backgrounds)
- **Custom Backgrounds**: Auto-generated EPFL-themed backgrounds
  - `EPFL-Cover-BG.pdf` (classic cover with red gradient)
  - `EPFL-Front-Page-BG.pdf` (modern front page, clean white)
  - `EPFL-Back-Page-BG.pdf` (clean white back page)

### 4. Metadata Template (Metadata/Metadata.tex)
Updated with EPFL-specific information:
- University: École Polytechnique Fédérale de Lausanne (EPFL)
- School: School of Computer and Communication Sciences
- Department: Department of Computer Science
- Supervisors and committee structure adapted for EPFL format

### 5. Font Compatibility
- Enhanced font configuration for pdfLaTeX compatibility
- Automatic detection of compilation engine (pdfLaTeX vs XeLaTeX/LuaLaTeX)
- Fallback fonts for pdfLaTeX users

## File Structure

```
/workspaces/epfl-thesis/
├── IPLeiriaMain.tex              # Main document (configured for EPFL)
├── IPLeiriaThesis.cls            # Class file (EPFL support added)
├── Configurations/
│   ├── 00-Fonts.sty             # Font configuration (pdfLaTeX compatible)
│   └── 01-Colors.sty            # EPFL brand colors
├── Metadata/
│   └── Metadata.tex             # EPFL metadata template
├── Matter/
│   ├── 00-Cover.tex             # Cover page (EPFL logos & backgrounds)
│   └── 01-Front-Page.tex        # Front page (EPFL branding)
├── Figures/Theme/
│   ├── Logotypes/               # EPFL logo files
│   ├── EPFL-Cover-BG.pdf        # Custom EPFL cover background
│   ├── EPFL-Front-Page-BG.pdf   # Custom EPFL front page background
│   └── EPFL-Back-Page-BG.pdf    # Custom EPFL back page background
├── create_epfl_backgrounds.py   # Script to generate backgrounds
└── README-EPFL.md              # This documentation
```

## Compilation

The template successfully compiles with:
```bash
pdflatex IPLeiriaMain.tex
```

Output: `IPLeiriaMain.pdf` (55 pages, ~1.1MB)

## Features Verified

✅ EPFL school option working  
✅ EPFL colors properly applied  
✅ EPFL logos displaying correctly  
✅ Custom EPFL backgrounds rendering  
✅ pdfLaTeX compatibility resolved  
✅ Complete PDF generation successful  
✅ All 55 pages rendering without errors  

## Usage Notes

1. **Font Commands**: The template provides pdfLaTeX-compatible font commands:
   - `\latofont` - Sans-serif font for headings
   - `\garamondfont` - Roman font alternative
   - `\minionfont` - Roman font alternative

2. **Color Usage**: Use EPFL colors in your content:
   ```latex
   \textcolor{epflred}{EPFL Red Text}
   \textcolor{epflgray}{EPFL Gray Text}
   ```

3. **Background Customization**: The background generation script can be modified to create additional EPFL-themed graphics if needed.

## Original Template

Based on IPLeiria Thesis Template by Instituto Politécnico de Leiria  
EPFL customization completed June 2025
