#!/bin/bash

git diff --unified=0 HEAD~1 HEAD~0 | grep -Po '^\+\+\+ ./\K.*|^@@ -[0-9]+(,[0-9]+)? \+\K[0-9]+(,[0-9]+)?(?= @@)' | tee ./output.txt


#/g1/teamcity/TeamCity/ExternalTools/GitDiffLines.sh
