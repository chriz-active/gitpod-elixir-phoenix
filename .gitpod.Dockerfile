FROM elixir

# install docker
RUN curl -fsSL https://get.docker.com -o get-docker.sh \
    && sh get-docker.sh

# install useful tools for phoenix
RUN apt-get update \
    && apt-get install inotify-tools -y \
    && mix local.hex --force \
    && mix local.rebar --force

# setup some gitpod helpers
ENV HOME=/home/gitpod

WORKDIR $HOME
# custom Bash prompt
RUN { echo && echo "PS1='\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] $ '" ; } >> .bashrc

ENV SHELL=/bin/bash

# set hex and mix home to somewhere the user has write permissions
ENV HEX_HOME=/workspace
ENV MIX_HOME=/workspace
