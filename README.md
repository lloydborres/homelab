# My HomeLab

Welcome to my homelab setup.

Check out each service's Readme file for instructions.

Most of my containers uses Tailscale as a sidecar allowing me separate them and access anywhere as long as I'm connected to my tailnet. They are configured so I don't have to add the port when accessing them.

## Docker

**Official website:** https://www.docker.com

### Running Services

- [x] [Nginx with Cloudflare Tunnel](/nginx-proxy-manager/)
- [x] [Authentik with Nginx](/authentik/)

### Experimenting

- [ ] Jellyfin
- [ ] Immich
- [ ] Pi-hole

### Planned Additions

- [ ] Navidrome
- [ ] Vaultwarden

## Tailscale

Tailscale is a mesh VPN service that connects devices and services securely across different networks using WireGuard protocol.

**Official website:** https://tailscale.com

**Original docker compose:** https://tailscale.com/kb/1282/docker#code-examples
