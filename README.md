# burnbox

Headless ephemeral torrent client behind VPN, cleaning up after itself.

## Usage

```bash
curl -sL https://raw.githubusercontent.com/theowiik/burnbox/main/run.sh | WIREGUARD_PRIVATE_KEY=key WIREGUARD_ADDRESSES=addr bash -s "magnet:?xt=..."
```

Downloads land in `./burnbox-downloads/`. When the torrent finishes, everything is cleaned up automatically.

## Requirements

- Docker
- [Mullvad](https://mullvad.net) WireGuard key
