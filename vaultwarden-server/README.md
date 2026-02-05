# Vaultwarden (with Tailscale and Nginx)

Vaultwarden is an alternate server implementation of the Bitwarden Client API, a password manager, and is compatible with the official Bitwarden clients.

The service is reverse-proxied through Nginx while Tailscale is installed in the server not as a sidecar.

## Vaultwarden Initial Setup

1. Make sure to setup [Nginx](../nginx-proxy-manager/README.md) first and keep it running.
2. Open a terminal and navigate to this [directory](/vaultwarden-server/).
3. Create an `.env` file based from [.env.example](.env.example).
4. Update the following variables in your recently created `.env` file:
   - `VW_DOMAIN` - Set to your planned domain to use.
5. Run `docker compose up -d`.
6. Go to your Nginx Web UI, add a new Proxy Host and set the following:
   - Domain Names: `vw.domain.tld` depending on what you set in your `.env` file.
     > Note: This must match to what you set in `VW_DOMAIN` variable.
   - Scheme: `http`
   - Forward Hostname/IP: `vaultwarden-server`
   - Forward Port: `80`
7. In your domain DNS records, make sure to create an `A` record pointing to your Tailscale server machine IP address that is running Nginx.
8. You can now visit your domain and create your account from there.

## Notes

- This service requires [Nginx](/nginx-proxy-manager/) to be running before it is started.
- You'll still need to be connected to your tailnet to access the server since the DNS record is pointing to your Tailscale IP address. If you need it publicly accessible, you can point the DNS record to your Cloudflare Tunnel instead.
- You'll need to own a domain name to use Nginx with Vaultwarden. If you don't own a domain, you can run Tailscale as a sidecar by modifying the docker compose. Please see other examples as a reference like the [Jellyfin compose file](../jellyfin-server/docker-compose.yml) and skip the Nginx part.
- All of the data will be stored in [/.docker-data/vaultwarden-server](../.docker-data/vaultwarden-server) directory if you didn't change the variables pointing here. You can use it for backup and restore.

## Links

- https://github.com/dani-garcia/vaultwarden