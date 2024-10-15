# Use an appropriate base image
FROM ubuntu:latest

# Set maintainer
LABEL maintainer="Tuan Thai <tuanthai@example.com>"

# Update package list and install dependencies
RUN apt update -y && \
    apt install -y python3-pip python3-dev build-essential python3-venv

# Set working directory
WORKDIR /flask_app

# Copy your requirements file
ADD requirements.txt .

# Create a virtual environment
RUN python3 -m venv /venv

# Install packages into the virtual environment
RUN /venv/bin/pip install --upgrade pip
RUN /venv/bin/pip install -r requirements.txt

# Set the PATH to include the virtual environment
ENV PATH="/venv/bin:$PATH"

# Copy the rest of your application code
ADD . .

# Set the entry point to your script
ENTRYPOINT ["python3", "flask_docker.py"]  # Replace with your actual script name
