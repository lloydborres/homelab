# My HomeLab V1

Welcome to my homelab setup.

Check out each service's Readme file for instructions.

Most of my containers uses Tailscale as a sidecar allowing me separate them and access anywhere as long as I'm connected to my tailnet. They are configured so I don't have to add the port when accessing them.

## Docker

**Official website:** https://www.docker.com

### Running Services

- [x] [Jellyfin with Tailscale](/jellyfin-server/)
- [x] [Immich with Tailscale](/immich-server/)
- [x] [Vaultwarden with Tailscale](/vaultwarden-server/)
- [x] [Pi-hole with Tailscale](/pihole/)

## Tailscale

Tailscale is a mesh VPN service that connects devices and services securely across different networks using WireGuard protocol.

**Official website:** https://tailscale.com

**Original docker compose:** https://tailscale.com/kb/1282/docker#code-examples

### Creating a Tag in Tailscale

Under [Access controls](https://login.tailscale.com/admin/acls/file), add the following:

```
# Sample Code
"tagOwners": {
   "tag:my-server":            ["admin@domain.com"],
   "tag:docker-container":         ["admin@domain.com"],
},
```
