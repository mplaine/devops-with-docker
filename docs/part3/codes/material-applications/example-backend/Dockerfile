# Builder stage
FROM golang:1.16.15-alpine3.15 AS builder

# Create the appuser with home directory
RUN adduser -D appuser

# Change the working directory
WORKDIR /usr/src/app

# Copy all of the source code
COPY . .

# Build the binary file using static linking for C libraries
RUN CGO_ENABLED=0 go build -o /go/bin/server


# Server stage
FROM scratch AS server

# Copy the user and group files
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /etc/group /etc/group

# Copy the binary file
COPY --from=builder /go/bin/server /go/bin/server

# Set the environment variables
ENV PORT=8000
ENV REQUEST_ORIGIN="http://localhost:5000"

# Switch to the appuser
USER appuser

# Expose port 8000
EXPOSE 8000

# Run the binary file
ENTRYPOINT ["/go/bin/server"]
