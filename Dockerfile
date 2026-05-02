FROM nikolaik/python-nodejs:python3.11-nodejs20


LABEL "com.github.actions.name"="Serverless Python3.11"
LABEL "com.github.actions.description"="Wraps the Serverless Framework to enable common Serverless commands. Built for Python3.11 Lambda function runtime"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"


RUN npm cache clean --force
RUN npm config set registry https://registry.npmjs.org/
# Surface the actual npm error message — current CI failures only show the
# "log file" hint without the cause.
RUN npm i -g --foreground-scripts --loglevel=verbose serverless@3.38.0 \
    || (echo "===== NPM DEBUG LOG =====" && cat /root/.npm/_logs/*.log; exit 1)
ENTRYPOINT ["serverless"]
