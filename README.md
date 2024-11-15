# Jira-GitHub Integration

## Overview
This repository contains a GitHub Actions workflow that enables seamless integration between Jira and GitHub, allowing users to create branches and commits directly from Jira issue comments.

## Prerequisites
- GitHub repository connected to Jira
- GitHub for Jira app installed
- Appropriate permissions in both Jira and GitHub

## Setup Instructions

### 1. Configure GitHub Secrets
In your GitHub repository settings, add the following secrets:
- `JIRA_BASE_URL`: Your Jira instance base URL
- `JIRA_USER_EMAIL`: Email associated with Jira account
- `JIRA_API_TOKEN`: Jira API token for authentication

### 2. Workflow Commands

#### Create a Branch
To create a new branch from a Jira issue:
- Comment on the Jira issue: `/create-branch feature/branch-name`

#### Create a Commit
To create an empty commit from a Jira issue:
- Comment on the Jira issue: `/create-commit Your commit message here`

## How It Works
1. When a comment is added to a Jira issue
2. GitHub Actions workflow is triggered
3. Branch or commit is created based on the command
4. Jira issue is updated with the action details

## Troubleshooting
- Ensure GitHub for Jira app is installed
- Verify GitHub Actions workflow permissions
- Check Jira and GitHub secret configurations

## Security
- Uses GitHub Actions bot for commits
- Requires explicit comment commands
- Limits actions to repository collaborators

## Contributing
Please report any issues or suggest improvements by creating a GitHub issue.