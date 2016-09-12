#!/bin/sh
git checkout gh-pages
git pull
git merge master
jekyll
mkdir raw
cp -R _site/* raw/ 
