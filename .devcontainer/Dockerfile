FROM ubuntu:22.04

# Install tools (bebas ditambah sesuai kebutuhan)
RUN apt-get update && apt-get install -y \
    libssl3 \
    curl \
    git \
    sudo \
    vim \
    build-essential \
    && rm -rf /var/lib/apt/lists/*
