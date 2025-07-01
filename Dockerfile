FROM ollama/ollama:latest
USER root

# Ensure wget & python3 are present
RUN apt-get update \
 && apt-get install -y wget python3-pip \
 && rm -rf /var/lib/apt/lists/*

COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

ENTRYPOINT ["/usr/local/bin/startup.sh"]
