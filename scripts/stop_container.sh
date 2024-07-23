#!/bin/bash
set -e

# Stop the running container (if any)
echo "Hi"

#!/bin/bash

# Define the image name to search for
IMAGE_NAME="amishpsoni/demoimages"

# Get the image IDs for the specified image name
IMAGE_IDS=$(docker images --format "{{.ID}}" "$IMAGE_NAME")

# Print debug information
echo "Searching for running containers with image: $IMAGE_NAME"
echo "Found image IDs: $IMAGE_IDS"

# Initialize an empty variable to store container IDs
CONTAINER_IDS=""

# Loop through each image ID to find running containers
for IMAGE_ID in $IMAGE_IDS; do
  # Find the container IDs for the running containers with the specified image ID
  CONTAINER_IDS+=$(docker ps --filter "ancestor=$IMAGE_ID" --format "{{.ID}}")" "
done

# Print debug information
echo "Found container IDs: $CONTAINER_IDS"

# Check if any containers were found
if [ -z "$CONTAINER_IDS" ]; then
  echo "No running containers found for image: $IMAGE_NAME"
else
  # Loop through each container ID and stop the container
  for CONTAINER_ID in $CONTAINER_IDS; do
    echo "Stopping container ID: $CONTAINER_ID"
    docker stop $CONTAINER_ID
  done
  echo "All containers for image $IMAGE_NAME have been stopped."
fi
