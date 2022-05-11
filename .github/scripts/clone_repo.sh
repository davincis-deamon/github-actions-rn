#!/bin/sh
set -eo pipefail
ssh-keygen -f /Users/runner/.ssh/known_hosts -R "$REPO_5_HOSTNAME"
GIT_SSH_COMMAND='ssh -i ./.github/secrets/ssh_key -o IdentitiesOnly=yes StrictHostKeyChecking=no -o StrictHostKeyChecking=no' git clone --branch "$PRIVATE_REPO_BRANCH" "$PRIVATE_REPO_SSH_URL" private_repo

