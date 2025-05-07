FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ansible \
    python3 \
procps\
    && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

