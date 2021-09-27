#!/bin/sh
set -e

mvndir=$1

ls

codearttoken=$(cat tmptoken)

echo $codearttoken

cd $mvndir

sed  "s/mytoken/$codearttoken/" mvn/settings.xml > /mvn/result.xml

cat /mvn/result.xml

mvn --settings /mvn/result.xml deploy