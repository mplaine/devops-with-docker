FROM golang:1.16.15

# Change the working directory
WORKDIR /usr/src/app

# Copy all of the source code
COPY . .

# Build the project
RUN go build

# Expose port 8080
EXPOSE 8080

# Set the environment variables
ENV REQUEST_ORIGIN="http://localhost:8080"

# Run the project
CMD ["./server"]
