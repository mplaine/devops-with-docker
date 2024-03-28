# Builder stage
FROM node:16.20.2-alpine3.18 AS builder

# Change the working directory
WORKDIR /usr/src/app

# Copy the files required for dependencies to be installed
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy all of the source code
COPY . .

# Set build-time variables
ARG REACT_APP_BACKEND_URL="http://localhost:8000"

# Set the environment variables
ENV REACT_APP_BACKEND_URL=${REACT_APP_BACKEND_URL}

# Build the static files
RUN npm run build


# Server stage
FROM nginx:1.25.4-alpine3.18 AS server

# Copy the static files
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

# Change permissions
RUN chown -R nginx:nginx /var/cache/nginx /var/log/nginx && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid

# Switch to the nginx user
USER nginx

# Expose port 80
EXPOSE 80

# Serve the static files
CMD ["nginx", "-g", "daemon off;"]
