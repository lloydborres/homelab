# My HomeLab

<img src="./.docs/images/homelab_diagram.webp" alt="v2 HomeLab Diagram" width="100%"/>

<p align="center">
<sub><em>v2 HomeLab Diagram</em></sub>
</p>

## Setup Overview:

- A Linux machine as a server with Docker installed.
- Admin can manage the server through SSH from another machine.
- Cloudflare Tunnel as a sidecar to make certain services publicly accessible.
  - authentik will be publicly accessible to be used for Tailscale sign up and login.
- Tailscale sidecar for Nginx Proxy Manager.
  - Will make the other services not be publicly accessible.
- Nginx Proxy Manager
  - Everything is connected through the `proxy-bridge` network in Docker.
  - All traffic will route through Nginx.
    - The root domain that comes from Cloudflare Tunnel will be forwarded to authentik.
    - The sub domains that are pointing to the Tailscale IP will be forwarded to their respective services.
- Tailscale sidecar for Pi-hole.
  - Isolate Pi-hole to it's own machine so we can set our Tailscale DNS nameservers to point to the Pi-hole container.

## Version Notes

- `v2.x.x` - Uses Nginx as reverse proxy.
  - Current `main` branch.
  - Recommended if you have a custom domain.
- `v1.x.x` - Uses Tailscale as sidecar.
  - Please see `support/v1` branch.
  - Recommended for beginners, standalone services or Tailscale only setup.

## Docker

**Official website:** https://www.docker.com

### Running Services

- [x] [**Nginx Proxy Manager** with **Tailscale** and **Cloudflare Tunnel**](/nginx-proxy-manager/)
  - A reverse proxy
- [x] [**Authentik**](/authentik/)
  - An IdP (Identity Provider) and SSO (Single Sign On) platform
- [x] [**Jellyfin**](/jellyfin-server/)
  - A media server
- [x] [**Immich**](/immich-server/)
  - A photo and video management solution
- [x] [**Vaultwarden**](/vaultwarden-server/)
  - A password manager, alternate implementation of Bitwarden
- [x] [**Pi-hole** with Tailscale](/pihole/)
  - A DNS/Ad blocker
- [x] [**Forgejo**](/forgejo-server/)
  - A Git Repository
- [x] [**Navidrome**](/navidrome-server/)
  - A music server
- [x] [**RomM**](/romm-server/)
  - A ROM Manager with emulator

### Experimenting

- [ ] Containerizing a React Application

### Planned Additions

- [ ] Joplin
- [ ] Headscale (?)

## Setup Guide

1. [Setup Server](./.docs/1%20Setup%20Server.md)
2. [Setup Reverse Proxy](./.docs/2%20Setup%20Reverse%20Proxy.md)
