#!/bin/sh
set -e

mvndir=$1
awsowner=$2

echo "codeartifact get-authorization-token --domain dgp-mvn-artifacts-domain --domain-owner $awsowner --query authorizationToken --output text > /tmptoken"

aws codeartifact get-authorization-token --domain dgp-mvn-artifacts-domain --domain-owner $awsowner --query authorizationToken --output text > /tmptoken

ls /

codearttoken=$(cat /tmptoken)

echo $codearttoken

cd $mvndir

sed  "s/mytoken/$codearttoken/" mvn/settings.xml > /result.xml

cat /result.xml

mvn --settings /result.xml deploy