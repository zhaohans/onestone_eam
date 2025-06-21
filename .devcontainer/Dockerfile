FROM frappe/bench:latest

# Install additional development tools
RUN apt-get update && apt-get install -y \
    git \
    vim \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Ensure frappe user has access to workspace
RUN chown -R frappe:frappe /workspace

# Switch to frappe user
USER frappe 