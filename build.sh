#!/bin/sh
git checkout gh-pages
git pull
git merge master
jekyll build
mkdir raw
cp -R _site/* raw/
rm -r _*
rm -r assets
rm -r resources
rm about.md
cp -R raw/* .
#rm -r raw
