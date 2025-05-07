FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    openjdk-11-jdk \
    ansible \
    sudo \
    net-tools \
    procps \
    curl \
    python3 \
    libexpat1 \
    tomcat9 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

