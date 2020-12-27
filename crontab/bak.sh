#!/bin/bash

# crontab example:
#  m h dom mon dow command
# 45  0-8  * * *   ~/b/bak.sh
# 45 17-23 * * *   ~/b/bak.sh

cd ~/g
grep -oh "url = .*" */.git/config | cut -d " " -f3 > ~/b/repos.txt
for d in */; do
    cd $d
    git add .
    git diff --patch --staged > ~/b/uncommitted-patches/$(basename $d)-backup.patch.diff
    # restore in repo x: patch -p1 < ~/b/uncommitted-patches/x-backup.patch.diff
    git reset HEAD
    cd ..
done
find ~/b/uncommitted-patches/ -size  0 -print -delete

cd ~/b
git add .; git commit -m "$( date +%F )"; git push
