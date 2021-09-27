#!/bin/sh
set -e

mvndir=$1
awsowner=$2
region=$3
aws_access_key_id=$4
aws_secret_access_key=$5

aws configure set default.region $region
aws configure set aws_access_key_id $aws_access_key_id
aws configure set aws_secret_access_key $aws_secret_access_key


aws codeartifact get-authorization-token --domain dgp-mvn-artifacts-domain --domain-owner $awsowner --query authorizationToken --output text > /tmptoken

ls /

codearttoken=$(cat /tmptoken)

echo $codearttoken

cd $mvndir

sed  "s/mytoken/$codearttoken/" mvn/settings.xml > /result.xml

cat /result.xml

mvn --settings /result.xml deploy