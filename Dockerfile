# syntax=docker/dockerfile:experimental

# ----------------------------------------------------
# cimg/python:3.11.2 => @sha256:3235326357dfb65f1781dbc4df3b834546d8bf914e82cce58e6e6b676e23ce8f
FROM cimg/python@sha256:4a244531b57e4e1eba0d3aa1032fdb4c7a51c5b48bbce1ab86af0ec387a7753c

RUN sudo apt-get update 

COPY known_hosts ./

RUN sudo mkdir -m 0700 -p /root/.ssh
RUN cat ./known_hosts | sudo tee /root/.ssh/known_hosts

RUN --mount=type=ssh,required=true \
    sudo --preserve-env=SSH_AUTH_SOCK ssh -vT git@github.com || true