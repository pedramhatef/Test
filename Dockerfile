FROM ubuntu:latest

# Install necessary packages
RUN apt-get update && \
    apt-get install -y git cmake build-essential nodejs npm

# Clone TON repository
RUN git clone --recursive https://github.com/ton-blockchain/ton /root/ton

# Build TON components
RUN cd /root/ton && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j$(nproc)

# Set environment variables
ENV TON_SRC_PATH=/root/ton
ENV PATH=$TON_SRC_PATH:$PATH

# Set default working directory
WORKDIR /root/ton
