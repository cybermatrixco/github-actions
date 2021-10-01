FROM nikolaik/python-nodejs:python3.9-nodejs14


# install python3.7 for deepsecurity
RUN set -x \
    && pythonVersions='python3.7' \
    && apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common \
    && apt-add-repository -y ppa:fkrull/deadsnakes \
    && apt-get update \
    && apt-get install -y --no-install-recommends $pythonVersions \
    && apt-get purge -y --auto-remove software-properties-common \
    && rm -rf /var/lib/apt/lists/*

LABEL version="1.0.0"
LABEL repository="https://github.com/imaduddinamajid/github-action"
LABEL homepage="https://github.com/imaduddinamajid/github-action"
LABEL maintainer="Imaduddin A Majid <imaduddinamajid@gmail.com> (https://imaduddinamajid.com)"

LABEL "com.github.actions.name"="Serverless Python3.9"
LABEL "com.github.actions.description"="Wraps the Serverless Framework to enable common Serverless commands. Built for Python3.9 Lambda function runtime"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"


RUN npm cache clean --force
RUN npm config set registry https://registry.npmjs.org/
RUN npm i -g serverless
ENTRYPOINT ["serverless"]
