#!/bin/bash -vx
pakku export

git branch -D live
git branch -D client
git checkout --orphan live

rm -r $(ls -A | grep -v -e build -e .git)
rm -r .github
rm .gitignore

# This line has problems

mv -v "./build/.cache/serverpack"/* "./"
mv -v "./build/curseforge"/* "../__temp/"

rm -r build

git add .
git commit -m "Build"
git push -f origin live

git checkout --orphan client
rm -r $(ls -A)
mv -v "../__temp"/* "./"
rm -r "../__temp"
git push -f origin client

git checkout stable