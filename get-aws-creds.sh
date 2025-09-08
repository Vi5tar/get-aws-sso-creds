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

command_output=$(aws configure export-credentials --profile "$profile" --format env 2>&1)
exit_code=$?

if [ $exit_code -ne 0 ]; then
    if echo "$command_output" | grep -q "^Error loading SSO Token:"; then
        aws sso login --profile "$profile"

        eval "$(aws configure export-credentials --profile "$profile" --format env)"
    else
        echo "$command_output"
        return 1
    fi
else
    eval "$command_output"
fi