FROM docker:latest

# Change the working directory
WORKDIR /usr/src/app

# Copy the script
COPY builder.sh .

# Change file permissions
RUN chmod +x builder.sh

# Default executable
ENTRYPOINT ["./builder.sh"]
