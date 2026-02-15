# My HomeLab

Welcome to my HomeLab setup.

<img src="./docs/images/homelab_diagram.svg" alt="v2 HomeLab Diagram" width="100%"/>

<p align="center">
<sub><em>v2 HomeLab Diagram</em></sub>
</p>

Setup Overview:

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

- [x] [Nginx with Cloudflare Tunnel](/nginx-proxy-manager/)
- [x] [Authentik with Nginx](/authentik/)
- [x] [Jellyfin with Tailscale](/jellyfin-server/)
- [x] [Immich with Tailscale](/immich-server/)
- [x] [Vaultwarden with Tailscale and Nginx](/vaultwarden-server/)

### Experimenting

- [ ] Pi-hole

### Planned Additions

- [ ] Navidrome

## Tailscale

Tailscale is a mesh VPN service that connects devices and services securely across different networks using WireGuard protocol.

**Official website:** https://tailscale.com

**Original docker compose:** https://tailscale.com/kb/1282/docker#code-examples

> You can sign up to Tailscale using the available providers. If you choose to sign up with OIDC you can self-host [Authentik](/authentik/README.md#integrating-authentik-with-tailscale-via-oidc).
