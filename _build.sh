#!/bin/sh

set -ev

Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::html_document2')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::word_document2')"

