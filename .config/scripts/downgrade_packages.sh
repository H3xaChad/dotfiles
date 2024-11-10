#!/bin/bash

# Usage: ./downgrade_packages.sh <config_file>
# Example: ./downgrade_packages.sh packages.conf

# Check if a config file is provided
if [ -z "$1" ]; then
    echo "Error: Please provide a configuration file."
    exit 1
fi

CONFIG_FILE="$1"

# Check if 'downgrade' command is installed
if ! command -v downgrade &> /dev/null; then
    echo "The 'downgrade' tool is not installed. Installing it now..."
    sudo pacman -S downgrade
fi

# Array to store packages to add to IgnorePkg
ignore_packages=()

# Read each line in the config file
while IFS=' ' read -r package version ignore; do
    # Skip empty lines or lines starting with '#'
    if [[ -z "$package" || "$package" == \#* ]]; then
        continue
    fi

    echo "Attempting to downgrade $package to version $version..."
    echo "y" | sudo downgrade "$package" "$version"
    
    # Check if downgrade succeeded
    if [ $? -ne 0 ]; then
        echo "Failed to downgrade $package. Please check if version $version is available."
    else
        echo "$package successfully downgraded to version $version."
        # Add package to ignore list if specified
        if [ "$ignore" == "yes" ]; then
            ignore_packages+=("$package")
        fi
    fi
done < "$CONFIG_FILE"

# Add packages to IgnorePkg in /etc/pacman.conf if specified
if [ ${#ignore_packages[@]} -gt 0 ]; then
    echo "Adding specified packages to IgnorePkg to prevent future updates..."
    ignore_line="IgnorePkg = ${ignore_packages[*]}"
    
    # Check if the packages are already in IgnorePkg
    if ! grep -q "^$ignore_line" /etc/pacman.conf; then
        echo "$ignore_line" | sudo tee -a /etc/pacman.conf > /dev/null
        echo "Packages added to IgnorePkg."
    else
        echo "Specified packages are already in IgnorePkg."
    fi
else
    echo "No packages specified for IgnorePkg."
fi

echo "Downgrade process complete!"

