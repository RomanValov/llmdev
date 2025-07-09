FROM node:22-slim

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
	&& apt-get install -y --no-install-recommends \
		curl \
		git \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/local/share/npm-global \
	&& chown -R node:node /usr/local/share

ENV NPM_CONFIG_PREFIX=/usr/local/share/npm-global
ENV PATH=$PATH:/usr/local/share/npm-global/bin

RUN npm install -g \
		@google/gemini-cli \
		@anthropic-ai/claude-code \
		@openai/codex \
	&& npm cache clean --force

RUN touch /usr/local/bin/xdg-open \
	&& chmod +x /usr/local/bin/xdg-open

RUN mkdir -p /workspace && \
  chown -R node:node /workspace

WORKDIR /workspace

USER node
