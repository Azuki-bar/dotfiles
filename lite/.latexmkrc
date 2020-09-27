#!/usr/bin/perl

$latex     = 'uplatex %O -kanji=utf8 -no-guess-input-enc -synctex=1 -interaction=nonstopmode -file-line-error %S';
$xelatex   = 'xelatex %O -no-pdf -synctex=1 -shell-escape -interaction=nonstopmode %S';

$bibtex    = 'upbibtex %O %B';
$biber     = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$dvipdf    = 'dvipdfmx %O -o %D %S';
$makeindex = 'upmendex %O -o %D %S';
$pdf_mode  = '3'; # .tex -> .dvi -> .pdf
