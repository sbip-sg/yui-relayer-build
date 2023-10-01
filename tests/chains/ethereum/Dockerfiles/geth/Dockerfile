# Use Ubuntu as the base image
FROM ubuntu:20.04

# Arguments for chain ID and network ID
ARG CHAINID
ARG NETWORKID

# Set environment variables
ENV CHAINID ${CHAINID}
ENV NETWORKID ${NETWORKID}

# Update package list and install curl
RUN apt-get update && apt-get install -y curl

# Optionally, install geth if needed
# RUN apt-get install -y software-properties-common && \
#     add-apt-repository -y ppa:ethereum/ethereum && \
#     apt-get update && apt-get install -y ethereum

# Set the working directory
WORKDIR /root

# Copy geth binary and run.sh script into the image
COPY geth /root/geth
COPY run.sh /root/run.sh

# Expose port 8545
EXPOSE 8545

# Set the entrypoint script
ENTRYPOINT ["/root/run.sh"]
