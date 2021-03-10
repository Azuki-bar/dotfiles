#!/bin/bash

echo 'This script is sent this directory to UEC_SOL'
rsync -avzn ~/dotfiles uec:~/ --exclude .git/ --exclude README.md
echo 'please check these files. If not in trouble, please continue'
rsync -avz ~/dotfiles uec:~/ --exclude .git/ --exclude README.md
