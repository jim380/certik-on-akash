#!/bin/bash

pushd /node

export CERTIK_HOME="{PWD?}"


# This fails immediately, but creates the node keys
certik init "${CERTIK_MONIKER:-unknown}" --home $CERTIK_HOME/.certik

set -xe

# export bech addresses on http.
#
# note: should be unnecessary. rpc/status has:
#
# - node-id in `.node_info.id`
# - validator address in `.validator_info.address`,
#   but it is in hex and `akash keys parse` is broken (again).

if test -n "$ENABLE_ID_SERVER" ; then
  mkdir web
  certik tendermint show-node-id --home $CERTIK_HOME/.certik > web/node-id.txt
  certik tendermint show-validator --home $CERTIK_HOME/.certik > web/validator-pubkey.txt
  pushd web
  # Run a web server so that the file can be retrieved
  python3 -m http.server 8080 &
  popd
fi

curl -s "${GENESIS_URL?}" > $CERTIK_HOME/.certik/config/genesis.json

cat config.toml | python3 -u ./patch_config_toml.py > $CERTIK_HOME/.certik/config/config.toml

# Copy over all the other filesthat the node needs
cp -v app.toml $CERTIK_HOME/.certik/config/

# Run the node for real now 
exec certik start --home $CERTIK_HOME/.certik