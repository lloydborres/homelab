# Authentik

Authentik is used to authenticate access to my Tailscale account. The service is also reverse-proxied through Nginx via a Cloudflare Tunnel.

## Authentik Initial Setup

1. Make sure to setup [Nginx](../nginx-proxy-manager/README.md) first and keep it running.
2. Open a terminal and navigate to this [directory](/authentik/).
3. Create an `.env` file based from [.env.example](.env.example).
4. Update the following variables in your recently created `.env` file. Simply generate a long random string and set to the variables below. When using symbols, wrap the value with double quotes.
   - `PG_PASS`
   - `AUTHENTIK_SECRET_KEY`
5. Run `docker compose up -d`
6. Go to your Nginx Web UI, add a new Proxy Host and set the following:
   - Domain Names: `domain.com`, `id.domain.com` or something similar
     > Note: If you plan to use @domain.com in your Tailscale account, you'll need to dedicate root `domain.com` for Authentik. If not you will be using `id.domain.com` or whatever sub domain you added here.
   - Scheme: `https`
   - Forward Hostname/IP: `authentik-server`
   - Forward Port: `9443`
7. In your domain DNS records, make sure to create an `A` record pointing to your Cloudflare Tunnel.
8. Navigate to https://domain.com/if/flow/initial-setup/ and setup your account.

## Integrating Authentik with Tailscale via OIDC

1. Login to your Authentik Admin interface.
2. Create a new user under Directory. No need to grant any permissions. This account will be used as a Tailscale account owner.
   > Note: Also set an email for that user. Be sure to be consistent with the domain. If you're using `id.domain.com` then use something like `emailadd@id.domain.com`.
3. You can also create a new group only for Tailscale access.
4. Follow the [guide from Authentik](https://integrations.goauthentik.io/networking/tailscale/#authentik-configuration). Don't proceed with Tailscale configuration yet as you'll encounter an error if you do.
5. Before proceeding with Tailscale configuration, go back to your Authentik Admin interface and navigate to System > Brands > Edit the default brand.
6. Under External user settings > Default application > set to Tailscale.
7. Navigate to https://login.tailscale.com/start/oidc and proceed with [Tailscale configuration](https://integrations.goauthentik.io/networking/tailscale/#tailscale-configuration).
8. You may also create more Tailscale users by creating them in your Authentik Admin interface and logging them in normally from Tailscale.

## Notes

- This service requires [Nginx](/nginx-proxy-manager/) to be running before it is started.
- You'll need to buy a domain name to use Tailscale with Authentik.
- If you didn't change the `_LOCATION` variable, all of your data will be stored in [/.docker-data/authentik](../.docker-data/authentik) directory. You can use it for backup and restore.

## Links

- https://goauthentik.io
- https://docs.goauthentik.io/install-config/install/docker-compose
