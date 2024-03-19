FROM node:16.20.2

# Change the working directory
WORKDIR /usr/src/app

# Copy the files required for dependencies to be installed
COPY package*.json ./

# Install the dependencies
RUN npm install
RUN npm install -g serve

# Copy all of the source code
COPY . .

# Set the environment variables
ENV REACT_APP_BACKEND_URL="http://localhost:8000"

# Build the static files
RUN npm run build

# Expose port 5000
EXPOSE 5000

# Serve the static files
CMD ["serve", "-s", "-l", "5000", "build"]
