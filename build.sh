#!/bin/sh
git checkout gh-pages
git fetch --all
git reset origin/gh-pages
git reset --hard master
jekyll build
cp -R _site/* .
rm -r _*
rm about.md
git add .
git commit -m "latest version"
git push origin gh-pages
git checkout master
