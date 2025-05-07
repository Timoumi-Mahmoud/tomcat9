FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ansible \
    python3 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]

