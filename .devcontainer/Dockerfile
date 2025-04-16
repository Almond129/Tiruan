FROM ubuntu:24.04

# Non-interactive untuk install otomatis
ENV DEBIAN_FRONTEND=noninteractive

# Update dan install paket dasar
RUN apt update && \
    apt install -y \
    sudo \
    curl \
    git \
    wget \
    vim \
    build-essential \
    libssl3 \
    ca-certificates \
    openssh-client \
    gnupg2 && \
    rm -rf /var/lib/apt/lists/*

# Tambahkan user vscode (harus sesuai dengan remoteUser di devcontainer.json)
RUN useradd -m -s /bin/bash vscode && \
    echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
    
