FROM nikolaik/python-nodejs:python3.11-nodejs20


LABEL "com.github.actions.name"="Serverless Python3.11"
LABEL "com.github.actions.description"="Wraps the Serverless Framework to enable common Serverless commands. Built for Python3.11 Lambda function runtime"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"


# Pin npm to 9.9.4 — npm 10.x silently exits during serverless v3 dep
# resolution (recent regression triggered by an @smithy/@aws-sdk update).
RUN npm install -g npm@9.9.4
RUN npm cache clean --force
RUN npm config set registry https://registry.npmjs.org/
RUN npm install -g serverless@3.38.0
ENTRYPOINT ["serverless"]
