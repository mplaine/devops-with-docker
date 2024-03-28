FROM node:21.7.1-alpine3.19 AS base

# Change the working directory
WORKDIR /usr/src/app

# Copy the files required for dependencies to be installed
COPY package*.json ./

# Install the dependencies
RUN npm install --only=production

# Copy all of the source code
COPY . .

# Remove the files required for dependencies to be installed
RUN rm ./package*.json

# Switch to the node user
USER node

# Expose port 8080
EXPOSE 8080

# Run the server
ENTRYPOINT ["node", "index.js"]
