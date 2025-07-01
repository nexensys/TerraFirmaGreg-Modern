#!/usr/bin/env bash
pakku export

if [ `git branch --list live`]
then
git branch -d live
fi
git checkout --orphan live

rm -r $(ls -A | grep -v -e build -e .git)

# This line has problems

mv -v "$PWD/build/.cache/serverpack/*" "$PWD/"

rm -r build

git add .
git commit -m "Build"
git push origin live

git checkout dev