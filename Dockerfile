FROM nikolaik/python-nodejs:python3.9-nodejs14


# install python3.7 for deepsecurity
ENV PATH /root/.pyenv/shims:/root/.pyenv/bin:$PATH
RUN set -x \
    && pythonVersions='3.7.12' \
    && buildDeps='ca-certificates curl git libjpeg-dev build-essential make libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev' \
    && apt-get update \
    && apt-get install --no-install-recommends -y $buildDeps \
    && curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash \
    && echo $pythonVersions | xargs -n 1 pyenv install \
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
