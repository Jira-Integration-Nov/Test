#!/bin/bash
# Jira-GitHub Integration Script

# Function to validate input
validate_input() {
    local input="$1"
    local type="$2"
    
    case "$type" in
        "branch")
            # Branch name validation
            if [[ ! "$input" =~ ^[a-zA-Z0-9/_-]+$ ]]; then
                echo "Invalid branch name. Use alphanumeric characters, /, _, and -."
                exit 1
            fi
            ;;
        "commit")
            # Commit message validation
            if [[ -z "$input" ]]; then
                echo "Commit message cannot be empty."
                exit 1
            fi
            ;;
        *)
            echo "Invalid validation type."
            exit 1
            ;;
    esac
}

# Function to log actions
log_action() {
    local action="$1"
    local details="$2"
    
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $action: $details" >> jira_github_integration.log
}

# Main integration function
integrate_jira_github() {
    local action="$1"
    local input="$2"
    
    # Validate input
    validate_input "$input" "$action"
    
    # Perform action based on type
    case "$action" in
        "branch")
            git checkout -b "$input"
            git push -u origin "$input"
            log_action "Branch Creation" "Created branch: $input"
            ;;
        "commit")
            git commit --allow-empty -m "$input"
            git push
            log_action "Commit Creation" "Created commit with message: $input"
            ;;
        *)
            echo "Unsupported action: $action"
            exit 1
            ;;
    esac
}

# Check if required arguments are provided
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <action> <input>"
    echo "Actions: branch, commit"
    exit 1
fi

# Call main integration function
integrate_jira_github "$1" "$2"