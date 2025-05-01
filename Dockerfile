FROM ubuntu:latest

# Instal CURL
RUN apt-get update && apt-get install -y curl

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Install flux
RUN curl -s https://fluxcd.io/install.sh | bash

# Clean stuff up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*