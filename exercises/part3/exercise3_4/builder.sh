#!/bin/sh

#############################################################################
# Publish image to Docker Hub.
#
# Example usage:
#   docker build -t builder .
#   docker run -e DOCKER_USER=mplaine -e DOCKER_PWD=$DOCKER_PWD \
#     -v /var/run/docker.sock:/var/run/docker.sock builder \
#     mplaine/express-app mplaine/express-app
#############################################################################

# BEST PRACTICES
set -o errexit
#set -o nounset
set -o pipefail

# ARGUMENTS & CONSTANTS
GITHUB_REPO=${1}      # first argument
DOCKER_HUB_REPO=${2}  # second argument
TEMP_APP_DIR="app-temp"

# CHECK ARGUMENTS
echo "Step 1: Checking arguments..."
if [ -z "${GITHUB_REPO}" ]; then
  echo "Please provide a GitHub repository as the first argument (e.g., myaccount/myrepository)."
  exit
else
  GITHUB_REPO_URL="https://github.com/${GITHUB_REPO}.git"
  echo "GitHub repository: ${GITHUB_REPO}"
  echo "GitHub repository URL: ${GITHUB_REPO_URL}"
fi

if [ -z "${DOCKER_HUB_REPO}" ]; then
  echo "Please provide a Docker Hub repository as the second argument (e.g., myaccount/myrepository)."
  exit
else
  echo "Docker Hub repository: ${DOCKER_HUB_REPO}"
fi

# GIT CLONE
echo "Step 2: Downloading the repository from GitHub..."
git clone ${GITHUB_REPO_URL} ${TEMP_APP_DIR}

# DOCKER LOGIN
echo "Step 3: Logging in to Docker Hub..."
echo "${DOCKER_PWD}" | docker login -u ${DOCKER_USER} --password-stdin

# DOCKER BUILD
echo "Step 4: Building the Docker image..."
docker build -t ${DOCKER_HUB_REPO} "./${TEMP_APP_DIR}"

# DOCKER PUSH
echo "Step 5: Uploading the Docker image to Docker Hub..."
docker push ${DOCKER_HUB_REPO}

# CLEANUP
echo "Step 6: Deleting the downloaded repository..."
rm -rf ${TEMP_APP_DIR}
