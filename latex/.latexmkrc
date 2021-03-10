#!/usr/bin/perl

$latex     = 'uplatex %O -kanji=utf8 -synctex=1 -interaction=nonstopmode -file-line-error %S';
$xelatex   = 'xelatex %O -no-pdf -synctex=1 -shell-escape -interaction=nonstopmode %S';
$lualatex  = 'lualatex -shell-escape -synctex=1 -interaction=nonstopmode';

$bibtex    = 'upbibtex %O %B';
$biber     = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$dvipdf    = 'dvipdfmx %O -o %D %S';
$makeindex = 'upmendex %O -o %D %S';
$pdf_mode  = '3'; # .tex -> .dvi -> .pdf
