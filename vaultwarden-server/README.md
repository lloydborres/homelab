# Vaultwarden (with Tailscale)

Vaultwarden is an alternate server implementation of the Bitwarden Client API, a password manager, and is compatible with the official Bitwarden clients.

## Vaultwarden Initial Setup

1. Open a terminal and navigate to this [directory](/vaultwarden-server/).
2. Create an `.env` file based from [.env.example](.env.example).
3. Update the following variables in your recently created `.env` file:
   - `TS_HOSTNAME` - Sets a hostname for your machine in Tailscale. e.g. setting this to `vaultwarden` you'll be able to access the web app through `vaultwarden.xxx.ts.net`.
   - `TS_AUTHKEY` - Generate an Auth key under [Tailscale Admin Console Settings](https://login.tailscale.com/admin/settings/keys). A Tag must be applied. If you don't have a tag created yet, please see [Creating a Tag in Tailscale](../README.md#creating-a-tag-in-tailscale).
   - `VW_DOMAIN` - Set to your hostname plus your Tailnet DNS name `vaultwarden.xxx.ts.net`.
4. Run `docker compose up -d`.
5. Copy the machine's address (e.g. `vaultwarden.xxx.ts.net`) and enter in your browser.
6. You can now create an account and use it just like using Bitwarden. You can also use the Official Bitwarden apps by selecting the self-hosted option instead of using `bitwarden.com` and enter your `vaultwarden.xxx.ts.net` as host.

## Notes

- All of the data will be stored in [/.docker-data/vaultwarden-server](../.docker-data/vaultwarden-server) directory if you didn't change the variables pointing here. You can use it for backup and restore.

## Links

- https://github.com/dani-garcia/vaultwarden
