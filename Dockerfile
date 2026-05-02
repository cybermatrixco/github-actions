FROM nikolaik/python-nodejs:python3.11-nodejs20


LABEL "com.github.actions.name"="Serverless Python3.11"
LABEL "com.github.actions.description"="Wraps the Serverless Framework to enable common Serverless commands. Built for Python3.11 Lambda function runtime"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="red"


# Some @smithy / @aws-sdk packages now ship with `\workspace:^`\ protocol
# in their dependency manifest, which npm rejects with EUNSUPPORTEDPROTOCOL.
# pnpm understands the workspace protocol so we use it for the global install.
RUN corepack enable && corepack prepare pnpm@9.15.4 --activate
RUN pnpm config set registry https://registry.npmjs.org/
RUN pnpm add -g serverless@3.38.0
ENV PATH=$PATH:/root/.local/share/pnpm
ENTRYPOINT ["serverless"]
