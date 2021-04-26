FROM node:10.24.1-alpine

WORKDIR /root

LABEL version="0.1.0"
LABEL repository="https://github.com/axetroy/gh-pages-action"
LABEL homepage="https://github.com/axetroy/gh-pages-action"
LABEL maintainer="Axetroy <axetroy.dev@gmail.com>"

LABEL com.github.actions.name="gh-pages for Github Action"
LABEL com.github.actions.description="GitHub Action for Deploy to Github Pages"
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="blue"

RUN apk update && apk upgrade && \
  apk add --no-cache bash git openssh curl

RUN npm install -g gh-pages

ADD entrypoint.sh /entrypoint.sh

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
