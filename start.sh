#!/bin/bash

# Define the directories to be deleted
DIRS=("app/rootAVD")

# Loop through the directories and delete them if they exist
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        echo "Deleting directory: $DIR"
        rm -rf "$DIR"
    else
        echo "Directory $DIR does not exist."
    fi
done

#Define the files to be deleted
FILES=("app/frida-server" "app/supervisord.log" "app/supervisord.pid")

# Loop through the files and delete them if they exist
for FILE in "${FILES[@]}"; do
    if [ -f "$FILE" ]; then
        echo "Deleting file: $FILE"
        rm -rf "$FILE"
    else
        echo "File $FILE does not exist."
    fi
done

# Start Docker Compose
echo "Starting Docker Compose..."
docker compose up --build