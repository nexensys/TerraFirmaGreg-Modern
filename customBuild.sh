#!/usr/bin/env bash
pakku export

git branch -D live
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