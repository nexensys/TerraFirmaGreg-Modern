pakku export

if [ `git branch --list live`]
then
git branch -d live
fi
git checkout --orphan live
