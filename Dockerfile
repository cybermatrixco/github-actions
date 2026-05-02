FROM nikolaik/python-nodejs:python3.11-nodejs20


LABEL "com.github.actions.name"="Serverless Python3.11"
LABEL "com.github.actions.description"="Wraps the Serverless Framework to enable common Serverless commands. Built for Python3.11 Lambda function runtime"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"


RUN npm cache clean --force
RUN npm config set registry https://registry.npmjs.org/
# Pin exactly to 3.38.0 — later v3 releases require SERVERLESS_ACCESS_KEY
# license activation, which breaks `npm i -g` in CI.
RUN npm i -g serverless@3.38.0
ENTRYPOINT ["serverless"]
