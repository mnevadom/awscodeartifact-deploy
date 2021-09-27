FROM amazon/aws-cli as awstoken

WORKDIR /resultfile

RUN aws codeartifact get-authorization-token --domain dgp-mvn-artifacts-domain --domain-owner 500664183679 --query authorizationToken --output text > tmptoken

#COPY entrypoint.sh /entrypoint.sh

#COPY mvn /mvn

#ENTRYPOINT ["/entrypoint.sh"]

FROM maven:latest

COPY entrypoint.sh /entrypoint.sh

COPY --from=awstoken /resultfile/tmptoken .

ENTRYPOINT ["/entrypoint.sh"]