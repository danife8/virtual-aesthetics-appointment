#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Wait for PostgreSQL to be available
until nc -z db 5432; do
  echo "Waiting for PostgreSQL to start..."
  sleep 1
done

# Install any missing gems
bundle check || bundle install

# Run database migrations
bundle exec rails db:migrate || bundle exec rails db:setup

# Then exec the container's main process (what's set as CMD in the Dockerfile)
exec "$@"