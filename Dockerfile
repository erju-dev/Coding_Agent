FROM python:3.11-slim

# Create a workspace directory
WORKDIR /workspace

# Install system deps useful for building Python packages and general dev
RUN apt-get update \
    && apt-get install -y --no-install-recommends build-essential git curl \
    && rm -rf /var/lib/apt/lists/*

# Copy minimal requirements and install them
COPY requirements.txt /workspace/requirements.txt
RUN pip install --no-cache-dir -r /workspace/requirements.txt

# Default to an interactive shell so this container can be used as a dev container
CMD ["bash"]
