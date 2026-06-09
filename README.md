# EPFL Thesis

An open-source LaTeX template for creating professional theses, dissertations, and academic reports at **École polytechnique fédérale de Lausanne (EPFL)**.

## Quick Start

1. Clone this repository
2. Edit `Metadata/Metadata.tex` with your thesis information
3. Add your chapters in `Chapters/` and include them from `EPFLMain.tex`
4. Build the document:

```bash
make all
```

Or with `latexmk` directly:

```bash
latexmk
```

The main entry file is [`EPFLMain.tex`](EPFLMain.tex). The document class is [`EPFLThesis.cls`](EPFLThesis.cls).

## Requirements

- A TeX Live distribution (TeX Live, MacTeX, or BasicTeX)
- `latexmk`
- `biber`
- `Pygments` (for the `minted` package)

## Project Structure

| Directory | Purpose |
|-----------|---------|
| `Chapters/` | Your thesis chapters |
| `Matter/` | Cover, front page, copyright, glossary, appendices |
| `Metadata/` | Author, title, supervisor, and other document metadata |
| `Configurations/` | Fonts, colors, margins, and layout settings |
| `Figures/` | Images and EPFL theme assets |
| `Bibliography/` | BibLaTeX bibliography file |

## Class Options

Pass options to `\documentclass` in `EPFLMain.tex`:

- `language` — `english`, `portuguese`, or `spanish`
- `coverstyle` — `classic` or `bw`
- `chapterstyle` — `classic`, `fancy`, or `modern`
- `docstage` — `final` or `working`
- `media` — `paper` or `screen`
- `linkcolor` — any valid `xcolor` color name
- `aiacknowledgement` — `true` or `false`
- `listprefix` — `true` or `false`

See the User Guide chapter in the compiled PDF for full documentation.

## License

This project is released under the [LPPL 1.3c License](https://www.latex-project.org/lppl/lppl-1-3c/). See [`LICENSE`](LICENSE) for the full text and [`NOTICE.md`](NOTICE.md) for upstream attribution and change history.

## Credits

This template is based on [IPLeiria Thesis](https://github.com/joseareia/ipleiria-thesis) by [José Areia](https://github.com/joseareia), originally developed for the Polytechnic University of Leiria. The EPFL version is an independent derived work with EPFL branding and metadata defaults. The upstream author does not maintain or support this fork.
