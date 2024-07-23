#!/bin/bash
set -e

# Stop the running container (if any)
echo "Hi"

# Define the image name to search for
IMAGE_NAME="amishpsoni/demoimages"

# Find the container IDs for the running containers with the specified image
CONTAINER_IDS=$(docker ps --filter "ancestor=$IMAGE_NAME" --format "{{.ID}}")

# Check if any containers were found
if [ -z "$CONTAINER_IDS" ]; then
  echo "No running containers found for image: $IMAGE_NAME"
else
  # Loop through each container ID and stop the container
  for CONTAINER_ID in $CONTAINER_IDS
  do
    echo "Stopping container ID: $CONTAINER_ID"
    docker stop $CONTAINER_ID
  done
  echo "All containers for image $IMAGE_NAME have been stopped."
fi
