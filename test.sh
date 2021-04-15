#!/usr/bin/env bash
docker run \
  --env-file env/mainnet \
  --publish-all \
  --name certik-on-akash \
  --rm \
  certik-on-akash:local
