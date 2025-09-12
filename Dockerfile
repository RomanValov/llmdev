FROM node:22-slim

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
	&& apt-get install -y --no-install-recommends \
		bzip2 \
		ca-certificates \
		curl \
		git \
		libxcb1 \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/goose \
	&& chown -R node:node /opt/goose

RUN cd /opt/goose && curl -fsSL https://github.com/block/goose/releases/download/stable/download_cli.sh \
	| CONFIGURE=false GOOSE_BIN_DIR=/opt/goose bash

RUN mkdir -p /usr/local/share/npm-global \
	&& chown -R node:node /usr/local/share

ENV NPM_CONFIG_PREFIX=/usr/local/share/npm-global
ENV PATH=$PATH:/usr/local/share/npm-global/bin

RUN npm install -g \
		@google/gemini-cli \
		@anthropic-ai/claude-code \
		@openai/codex \
		@qwen-code/qwen-code \
	&& npm cache clean --force

RUN touch /usr/local/bin/xdg-open \
	&& chmod +x /usr/local/bin/xdg-open

RUN mkdir -p /workspace && \
	chown -R node:node /workspace

WORKDIR /workspace

USER node
