# Jellyfin (with Tailscale)

Jellyfin is a media server that lets you organize, manage, and stream your digital media to any device.

With Tailscale, you can access your Jellyfin server from anywhere, as long as you’re connected to your tailnet.

Running Tailscale as a sidecar isolates the service in its own machine, allowing you to access Jellyfin directly without specifying a port.

## Jellyfin Initial Setup

1. Open a terminal and navigate to this [directory](/jellyfin-server/).
2. Create an `.env` file based from [.env.example](.env.example).
3. Update the following variables in your recently created `.env` file:
   - `TS_HOSTNAME` - Sets a hostname for your machine in Tailscale. e.g. setting this to `jellyfin` you'll be able to access the web app through `jellyfin.xxx.ts.net`.
   - `TS_AUTHKEY` - Generate an Auth key under [Tailscale Admin Console Settings](https://login.tailscale.com/admin/settings/keys). A Tag must be applied. If you don't have a tag created yet, please see [Creating a Tag in Tailscale](../README.md#creating-a-tag-in-tailscale).
   - `JELLYFIN_MEDIA_LOCATION` - Point this to the folder containing the movies/series.
   - `JELLYFIN_GROUP_ADD=122` - This is for hardware acceleration. Check this [doc](https://jellyfin.org/docs/general/post-install/transcoding/hardware-acceleration) for more info.
   - `PUID` - Enter `id` in the terminal to get ids.
   - `PGID` - Enter `id` in the terminal to get ids.
4. Run `docker compose up -d`.
5. Approve the machine in your Tailscale Admin Console. You may skip this if you turned of Device Approvals.
6. Copy the machine's address (e.g. `jellyfin.xxx.ts.net`) and enter in your browser.
7. Follow the instructions setting up Jellyfin for the first time.

## Notes

- All of the data will be stored in [/.docker-data/jellyfin-server](../.docker-data/jellyfin-server) directory if you didn't change the variables pointing here. You can use it for backup and restore.

## Links

- https://jellyfin.org
- https://jellyfin.org/docs/general/installation/container
