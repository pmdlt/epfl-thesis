% EPFL Thesis LaTeX Class
% Copyright 2025-2026 Paul Madelénat (EPFL adaptations)
%
% Derived from IPLeiria Thesis by José Areia
%   https://github.com/joseareia/ipleiria-thesis
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
%
% This derived work is maintained independently of the upstream template.
% See NOTICE.md for change history and attribution.
%
% Repository: https://github.com/pmdlt/epfl-thesis
% Version: 1.0.0 - 2026/06/09

%%% Class Information %%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{EPFLThesis}[2026/06/09 EPFL Thesis Class]

\RequirePackage{expl3} % Required for writing LaTeX3 code in this class.

%%% Handle Class Options %%%
\ExplSyntaxOn

\cs_new:Npn \EPFLThesis_check_color:n #1 {
  \tl_set:Nn \l_tmpa_tl { #1 }
  \color_set:nn { \l_tmpa_tl } { #1 }
}

\keys_define:nn { EPFLThesis } {
    coverstyle .choices:nn =
        { classic, bw }
        { \tl_gset:Nn \g_EPFLThesis_mycover_tl { #1 } },
    coverstyle / unknown .code:n = 
        { \ClassWarningNoLine{EPFLThesis}{Specified~'coverstyle'~not~available.~Defaulting~to~'classic'} },
    coverstyle .default:n = { classic },
    coverstyle .initial:n = { classic },

    language .choices:nn = 
        { english, portuguese, spanish } 
        { \tl_gset:Nn \g_EPFLThesis_mylanguage_tl { #1 } },
    language / unknown .code:n = 
        { \ClassWarningNoLine{EPFLThesis}{Specified~'language'~not~available.~Defaulting~to~'english'} },
    language .default:n = { english },
    language .initial:n = { english },

    chapterstyle .choices:nn = 
        { classic, fancy, modern } 
        { \tl_gset:Nn \g_EPFLThesis_style_tl { #1 } },
    chapterstyle / unknown .code:n = 
        { \ClassWarningNoLine{EPFLThesis}{Specified~'chapterstyle'~not~available.~Defaulting~to~'classic'} },
    chapterstyle .default:n = { classic },
    chapterstyle .initial:n = { classic },

    docstage .choices:nn = 
        { working, final } 
        { \tl_gset:Nn \g_EPFLThesis_docstage_tl { #1 } },
    docstage / unknown .code:n = 
        { \ClassWarningNoLine{EPFLThesis}{Specified~'docstage'~not~available.~Defaulting~to~'working'} },
    docstage .default:n = { working },
    docstage .initial:n = { working },

    media .choices:nn = 
        { paper, screen } 
        { \tl_gset:Nn \g_EPFLThesis_media_tl { #1 } },
    media / unknown .code:n = 
        { \ClassWarningNoLine{EPFLThesis}{Specified~'media'~not~available.~Defaulting~to~'paper'} },
    media .default:n = { paper },
    media .initial:n = { paper },

    linkcolor .code:n = {
        \tl_gset:Nn \g_EPFLThesis_linkcolor_tl { #1 }
        \EPFLThesis_check_color:n { #1 }
        \tl_if_eq:NNTF \l_tmpa_tl \q_no_value {
            \tl_gset:Nn \g_EPFLThesis_linkcolor_tl { black }
            \ClassWarningNoLine{EPFLThesis}{Specified~'linkcolor'~not~available.~Defaulting~to~'black'}
        }
    },
    linkcolor .default:n = { black },
    linkcolor .initial:n = { black },

    doctype .choices:nn = 
        { thesis, report } 
        { \tl_gset:Nn \g_EPFLThesis_doctype_tl { #1 } },
    doctype / unknown .code:n = 
        { \ClassWarningNoLine{EPFLThesis}{Specified~'doctype'~not~available.~Defaulting~to~'thesis'} },
    doctype .default:n = { thesis },
    doctype .initial:n = { thesis },

    bookprint .choices:nn = 
        { true, false } 
        { \tl_gset:Nn \g_EPFLThesis_bookprint_tl { #1 } },
    bookprint / unknown .code:n = 
        { \ClassWarningNoLine{EPFLThesis}{Specified~'bookprint'~not~available.~Defaulting~to~'false'} },
    bookprint .default:n = { false },
    bookprint .initial:n = { false },

    aiacknowledgement .choices:nn = 
        { true, false } 
        { \tl_gset:Nn \g_EPFLThesis_aiacknowledgement_tl { #1 } },
    aiacknowledgement / unknown .code:n = 
        { \ClassWarningNoLine{EPFLThesis}{Specified~'aiacknowledgement'~not~available.~Defaulting~to~'true'} },
    aiacknowledgement .default:n = { true },
    aiacknowledgement .initial:n = { true },

    listprefix .choices:nn = 
        { true, false } 
        { \tl_gset:Nn \g_EPFLThesis_listprefix_tl { #1 } },
    listprefix / unknown .code:n = 
        { \ClassWarningNoLine{EPFLThesis}{Specified~'listprefix'~not~available.~Defaulting~to~'false'} },
    listprefix .default:n = { false },
    listprefix .initial:n = { false },
    
    unknown .code:n = 
        { \ClassWarningNoLine{EPFLThesis}{An~unknown~option~was~ignored.~Please~check~the~documentation~to~see~the~available~options} }
}

\newcommand{\LanguageOption}{\g_EPFLThesis_mylanguage_tl}
\newcommand{\CoverOption}{\g_EPFLThesis_mycover_tl}
\newcommand{\ChapterOption}{\g_EPFLThesis_style_tl}
\newcommand{\DocStageOption}{\g_EPFLThesis_docstage_tl}
\newcommand{\MediaOption}{\g_EPFLThesis_media_tl}
\newcommand{\ColorOption}{\g_EPFLThesis_linkcolor_tl}
\newcommand{\DocTypeOption}{\g_EPFLThesis_doctype_tl}
\newcommand{\BookPrintOption}{\g_EPFLThesis_bookprint_tl}
\newcommand{\AiAckOption}{\g_EPFLThesis_aiacknowledgement_tl}
\newcommand{\ListPrefixOption}{\g_EPFLThesis_listprefix_tl}

\ProcessKeyOptions[EPFLThesis]
\ExplSyntaxOff

%%% Load Master Class %%%
\LoadClass[a4paper,11pt,twoside]{report}

%%% Load Babel Package (Language) %%%
\expandafter\RequirePackage\expandafter[\LanguageOption]{babel}

%%% Required Packages %%%
\RequirePackage{ifthen} % Provides conditional statements.
\RequirePackage{etoolbox} % Advanced programming tools for LaTeX.
\RequirePackage{graphicx} % For including and manipulating images.
\RequirePackage{subcaption} % Subfigures and side-by-side captions.
\RequirePackage{tabularx} % Flexible-width tables.
\RequirePackage{xltabular} % Same as tabularx but to be used in long tables.
\RequirePackage{booktabs} % Professional table styling.
\RequirePackage{multirow} % Support for multirow cells in tables.
\RequirePackage{longtable} % Tables spanning multiple pages.
\RequirePackage{caption} % Customisation of captions.
\RequirePackage{enumitem} % Customisation of lists.
\RequirePackage{amsmath} % Advanced mathematical expressions.
\RequirePackage{amssymb} % Extended mathematical symbols.
\RequirePackage[dvipsnames]{xcolor} % Extended color support.
\RequirePackage{tcolorbox} % Creating colored and highlighted boxes.
\RequirePackage{varwidth} % Allows variable-width boxes.
\RequirePackage{titlesec} % Customisation of section and chapter titles.
\RequirePackage{titling} % Control over title and titlepage formatting.
\RequirePackage[toc,page]{appendix} % Formatting for appendices.
\RequirePackage[bookmarks,pdfusetitle]{hyperref} % Hyperlinks and PDF metadata.
\RequirePackage[symbols,acronym]{glossaries} % Create glossaries and acronyms.
\RequirePackage[calc,datesep={/}]{datetime2} % Enhanced date and time formatting.
\RequirePackage{xparse} % Advanced argument parsing for custom macros.
\RequirePackage{typearea} % Page layout adjustments (KOMA-Script).
\RequirePackage{eso-pic} % Adding elements to the page background.
\RequirePackage{setspace} % Adjust line spacing.
\RequirePackage[newfloat]{minted} % Syntax highlighting for code.
\RequirePackage{silence} % Suppress specific package warnings.
\RequirePackage{fontawesome5} % Font awesome icons.
\RequirePackage{calc} % Infix notation arithmetic.
\RequirePackage{soul} % A better underline.
\RequirePackage{mfirstuc} % Capitalise words in a sentence.
\RequirePackage{tikz} % Create high-quality graphics programmatically.
\RequirePackage{blindtext} % Generate placeholder text.

\tcbuselibrary{most} % Load most libraries from the tcolorbox package.
\WarningsOff[blindtext] % Suppress warnings from the blindtext package.

%%% Import Configurations - Maintain the Specified Order! %%%
\usepackage{Configurations/00-Fonts}
\usepackage{Configurations/01-Colors}
\usepackage{Configurations/02-Margins}
\usepackage{Configurations/03-References}
\usepackage{Configurations/04-Headers}
\usepackage{Configurations/05-Contents}
\usepackage{Configurations/06-Glossary}
\usepackage{Configurations/07-Chapters}
\usepackage{Configurations/08-Tables}
\usepackage{Configurations/09-Code}
\usepackage{Configurations/10-Macros}
\usepackage{Configurations/11-Metadata}
\usepackage{Configurations/12-Brand}
