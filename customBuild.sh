#!/bin/bash -vx
pakku export

git branch -D live
git checkout --orphan live

rm -r $(ls -A | grep -v -e build -e .git)
rm .github

# This line has problems

mv -v "./build/.cache/serverpack"/* "./"

rm -r build

git add .
git commit -m "Build"
git push -f origin live

git checkout dev