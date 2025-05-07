FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    ansible \
    sudo \
    net-tools \
    procps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

