FROM ubuntu:22.04

# Set timezone (opsional)
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    git \
    vim \
    build-essential \
    software-properties-common \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*
    
