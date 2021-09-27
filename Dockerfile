FROM amazon/aws-cli as awstoken

WORKDIR /resultfile

#RUN aws configure set default.region eu-west-3
#RUN aws configure set aws_access_key_id AKIAXJEPJFN7YBOYPH5T
#RUN aws configure set aws_secret_access_key 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
RUN aws codeartifact get-authorization-token --domain dgp-mvn-artifacts-domain --domain-owner 500664183679 --query authorizationToken --output text > tmptoken

#COPY entrypoint.sh /entrypoint.sh

#COPY mvn /mvn

#ENTRYPOINT ["/entrypoint.sh"]

FROM maven:latest

COPY entrypoint.sh /entrypoint.sh

COPY --from=awstoken /resultfile/tmptoken .

ENTRYPOINT ["/entrypoint.sh"]