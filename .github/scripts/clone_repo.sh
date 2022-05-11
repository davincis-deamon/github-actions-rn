#!/bin/sh
set -eo pipefail
rm -rf /Users/runner/.ssh/known_hosts
ssh-keygen -R "$REPO_5_HOSTNAME"
GIT_SSH_COMMAND='ssh -i ./.github/secrets/ssh_key -o IdentitiesOnly=yes StrictHostKeyChecking=no' git clone --branch "$PRIVATE_REPO_BRANCH" "$PRIVATE_REPO_SSH_URL" private_repo

