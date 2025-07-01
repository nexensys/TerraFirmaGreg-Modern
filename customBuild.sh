#!/usr/bin/env bash
pakku export

if [ `git branch --list live`]
then
git branch -D live
fi
git checkout --orphan live

rm -r $(ls -A | grep -v -e build -e .git)
rm .github

# This line has problems

mv -v "$PWD/build/.cache/serverpack/*" "$PWD/"

rm -r build

git add .
git commit -m "Build"
git push origin live

git checkout dev