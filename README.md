# CertiK On Akash

This guide allows you to run a CertiK node on the Akash network `akashnet-2`. It is currently configured for Certik testnet `yulei-2`.

# Prerequisites
- A full node on `akashnet-2`, to which you'll be submitting txs through the rpc endpoint `:26657`. Find the node setup instructions [here](https://docs.akash.network/guides/node).
*Alternatively, you can use one of [these](https://github.com/ovrclk/net/blob/master/mainnet/rpc-nodes.txt) public rpc* endpoints.
- Some AKT tokens to spare. You will need them for creating deployments, paying tx fees etc.

# How-To

INSERT NOTION LINK

# Local Testing

## Build docker image

```sh
make build
```

## Run local instance

```sh
./test.sh
```

See the [`env/mainnet`](env/) for local environment settings.

# Releasing

Make a tag that starts with a `v`, ex:

```sh
git tag -m "gr8 pupdates" v100.0.0
```
