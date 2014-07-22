#!/bin/bash
# This script will install TTF fonts in this directory into your user's .fonts
# directory

mkdir ~/.fonts

cp *.ttf ~/.fonts

sudo fc-cache -f -v
