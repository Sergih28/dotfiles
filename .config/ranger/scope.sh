#!/usr/bin/bash

# Check if the file extension is .env
if [[ "$1" == *.env ]]; then
    # Disable preview for .env files
    exit 1
fi

# Default behavior: enable preview for all other files
exit 2
