#!/usr/bin/env bash

git config --global user.name Azuki-bar
git config --global user.email 42642269+Azuki-bar@users.noreply.github.com

git config --global core.quatepath false
git config --global core.editor nvim
git config --global core.excludesfile ~/.gitignore_global

git config --global commit.gpgsign true

git config --global pull.rebase false
