# Use an official Ubuntu image as the base
FROM ubuntu:22.04

# Set the working directory
WORKDIR /app

# Copy application code to the container
COPY . /app

# Install required packages and Python dependencies
RUN apt update && \
    apt install -y python3 python3-pip python3-dev build-essential && \
    pip install --no-cache-dir -r requirements.txt

# Expose the port your Django app will run on (default is 8000)
EXPOSE 8000

# Set the default command to run the Django server
CMD ["sh", "-c", "python3 manage.py makemigrations && python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000"]
