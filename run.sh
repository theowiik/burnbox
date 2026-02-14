#!/bin/bash
set -e

if [ -z "$WIREGUARD_PRIVATE_KEY" ]; then
  echo "WIREGUARD_PRIVATE_KEY is required"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Usage: WIREGUARD_PRIVATE_KEY=key ./run.sh \"magnet:?...\""
  exit 1
fi

DIR=$(mktemp -d)
trap "cd /; docker compose -f $DIR/docker-compose.yml down -v 2>/dev/null; rm -rf $DIR" EXIT

curl -sO --output-dir "$DIR" https://raw.githubusercontent.com/theowiik/burnbox/main/docker-compose.yml

echo "🔥 burnbox"
export WIREGUARD_PRIVATE_KEY
export MAGNET="$1"
cd "$DIR"
docker compose up --abort-on-container-exit
