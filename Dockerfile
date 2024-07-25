# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set environment variables
ENV EMAIL=
ENV PASSWORD=

# Set the working directory
WORKDIR /app

# Copy the requirements.txt file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Python scripts to the container
COPY playcore.py .
COPY exposer.py .

# Expose port 8000 for the HTTP server
EXPOSE 80

# Start the Python HTTP server and the faucet script
CMD ["sh", "-c", "python exposer.py & python playcore.py"]
