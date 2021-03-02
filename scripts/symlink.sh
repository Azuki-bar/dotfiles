#!/usr/bin bash
user-local='$HOME/.local/bin'
for file in * do
	ln -s $file ${user-local}/$file
done

