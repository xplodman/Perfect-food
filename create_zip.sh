#!/bin/bash

# Define the array of files/directories to ignore
IGNORE_LIST=(
    ".idea/*"
    ".git/*"
    "required_scripts/*"
    "deploy_rsync.sh"
    "vendor/*"
    "composer.lock"
    "composer.json"
    "create_zip.sh"
    ".gitignore"
    "reset_database.sql"
    "insert_dummy_db.php"
)

# Remove the old zip file if it exists
if [ -f "FamilyRestaurant.zip" ]; then
    echo "Removing old FamilyRestaurant.zip..."
    rm FamilyRestaurant.zip
fi

# Build the `-x` exclude options for the zip command
EXCLUDE_OPTIONS=()
for item in "${IGNORE_LIST[@]}"; do
    EXCLUDE_OPTIONS+=(-x "$item")
done

# Create the zip file
echo "Creating new FamilyRestaurant.zip..."
zip -r FamilyRestaurant.zip . "${EXCLUDE_OPTIONS[@]}"
