# My HomeLab

Welcome to my homelab setup.

Check out each service's Readme file for instructions.

Most of my containers uses Tailscale as a sidecar allowing me separate them and access anywhere as long as I'm connected to my tailnet. They are configured so I don't have to add the port when accessing them.

## Docker

**Official website:** https://www.docker.com

### Running services

- [x] [Jellyfin with Tailscale](jellyfin-server/README.md)
- [x] [Immich with Tailscale](immich-server/README.md)
- [x] [qBittorrent with Gluetun](qbittorrent/README.md)
- [x] [Journey with Tailscale](journey-server/README.md)

### Experimenting

- [ ] Joplin
- [ ] nginx

### Todo

- [ ] Navidrome
- [ ] Vaultwarden

## Tailscale

Securely connect to anything on the internet with Tailscale. Deploy a WireGuard®-based VPN to achieve point-to-point connectivity that enforces least privilege.

**Official website:** https://tailscale.com

**Original docker compose:** https://tailscale.com/kb/1282/docker#code-examples
