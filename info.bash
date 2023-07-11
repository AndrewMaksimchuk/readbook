#!/usr/bin/env bash


projectdir=$(dirname $0)

. $projectdir/config.bash

book=$(config_get "book")

pdfinfo $book
