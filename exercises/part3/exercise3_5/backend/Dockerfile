FROM golang:1.16.15

# Change the working directory
WORKDIR /usr/src/app

# Copy all of the source code
COPY . .

# Set the environment variables
ENV PORT=8000
ENV REQUEST_ORIGIN="http://localhost:5000"

# Build the project
RUN go build

# Expose port 8000
EXPOSE 8000

# Create the appuser with home directory
RUN useradd -m appuser

# Switch to the appuser
USER appuser

# Run the project
CMD ["./server"]
