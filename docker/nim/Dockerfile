FROM mcr.microsoft.com/vscode/devcontainers/base:0-ubuntu-18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
  && apt-get -y install --no-install-recommends clang gcc curl zip unzip \
  && curl https://nim-lang.org/choosenim/init.sh -sSf | sh -s -- -y \
  && apt-get autoremove -y \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=dialog
ENV PATH /root/.nimble/bin:$PATH

RUN mkdir /workspace
WORKDIR /workspace