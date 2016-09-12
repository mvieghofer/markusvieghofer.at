#!/bin/sh
git checkout gh-pages
git pull
git merge -X theirs master
jekyll build
cp -R _site/* .
rm -r _*
rm about.md
git add .
git commit -m "latest version"
git push origin gh-pages
git checkout master
