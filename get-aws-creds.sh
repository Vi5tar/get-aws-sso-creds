#!/bin/bash

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --profile)
            profile="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            return 1
            ;;
    esac
done

# Check if the profile is provided
if [ -z "$profile" ]; then
    echo "Usage: $0 --profile <profile_name>"
    return 1
fi

eval "$(aws configure export-credentials --profile "$profile" --format env)"