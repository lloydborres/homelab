# Navidrome (with Tailscale)

Navidrome is a self-hosted music streaming service.

With Tailscale, you can access your Navidrome server from anywhere, as long as you’re connected to your tailnet.

Running Tailscale as a sidecar isolates the service in its own machine, allowing you to access Navidrome directly without specifying a port.

## Navidrome Initial Setup

1. Open a terminal and navigate to this [directory](/navidrome-server/).
2. Create an `.env` file based from [.env.example](.env.example).
3. Update the following variables in your recently created `.env` file:
   - `TS_HOSTNAME` - Sets a hostname for your machine in Tailscale. e.g. setting this to `navidrome` you'll be able to access the web app through `navidrome.xxx.ts.net`.
   - `TS_AUTHKEY` - Generate an Auth key under [Tailscale Admin Console Settings](https://login.tailscale.com/admin/settings/keys). A Tag must be applied. If you don't have a tag created yet, please see [Creating a Tag in Tailscale](../README.md#creating-a-tag-in-tailscale).
   - Update other necessary variables. Please see the comments near the variable name for more info.
4. Run `docker compose up -d`.
5. Approve the machine in your Tailscale Admin Console. You may skip this if you turned of Device Approvals.
6. Copy the machine's address (e.g. `navidrome.xxx.ts.net`) and enter in your browser.
7. Follow the instructions setting up Navidrome for the first time.

## Notes

- All of the data will be stored in [/.docker-data/navidrome-server](../.docker-data/navidrome-server) directory if you didn't change the variables pointing here. You can use it for backup and restore.

## Links

- https://www.navidrome.org
- https://www.navidrome.org/docs/installation/docker
