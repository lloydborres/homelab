# My HomeLab

Welcome to my homelab setup.

Check out each service's Readme file for instructions.

Most of my containers uses Tailscale as a sidecar allowing me separate them and access anywhere as long as I'm connected to my tailnet. They are configured so I don't have to add the port when accessing them.

## Docker

**Official website:** https://www.docker.com

### Running Services

- [x] [Nginx with Cloudflare Tunnel](/nginx-proxy-manager/)
- [x] [Authentik with Nginx](/authentik/)
- [x] [Jellyfin with Tailscale](/jellyfin-server/)

### Experimenting

- [ ] Immich
- [ ] Pi-hole

### Planned Additions

- [ ] Navidrome
- [ ] Vaultwarden

## Tailscale

Tailscale is a mesh VPN service that connects devices and services securely across different networks using WireGuard protocol.

**Official website:** https://tailscale.com

**Original docker compose:** https://tailscale.com/kb/1282/docker#code-examples

> You can sign up to Tailscale using the available providers. If you choose to sign up with OIDC you can self-host [Authentik](/authentik/README.md#integrating-authentik-with-tailscale-via-oidc). You'll need to buy a domain for this to work.
