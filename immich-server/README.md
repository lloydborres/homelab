# Immich (with Tailscale)

Self-hosted photo and video management solution.

Easily back up, organize, and manage your photos on your own server. Immich helps you
browse, search and organize your photos and videos with ease, without sacrificing your privacy.

With Tailscale, you can access your Jellyfin server from anywhere, as long as you’re connected to your tailnet.

Running Tailscale as a sidecar isolates the service in its own machine, allowing you to access Jellyfin directly without specifying a port.

## Immich Initial Setup

1. Open a terminal and navigate to this [directory](/jellyfin-server/).
2. Create an `.env` file based from [.env.example](.env.example).
3. Update the following variables in your recently created `.env` file:
   - `TS_HOSTNAME` - Sets a hostname for your machine in Tailscale. e.g. setting this to `immich` you'll be able to access the web app through `immich.xxx.ts.net`.
   - `TS_AUTHKEY` - Generate an Auth key under [Tailscale Admin Console Settings](https://login.tailscale.com/admin/settings/keys). A Tag must be applied. If you don't have a tag created yet, create one under [Access controls](https://login.tailscale.com/admin/acls/file).
     ```
     # Sample Code
     "tagOwners": {
        "tag:my-server":            ["admin@domain.com"],
        "tag:docker-container":         ["admin@domain.com"],
     },
     ```
   - `IMMICH_DATA_LOCATION` - This is where your photos/videos go to when uploaded. It will also contain other files so please select a dedicated folder. If you want to separate other data, you can comment out the other `_LOCATION` to separate them.
   - `IMMICH_EXTERNAL_PHOTOS_LOCATION_1` - Use this if you want to import existing photos/videos so you don't have to upload them. You can add more of these when necessary.
   - `TZ` - Set your preferred Timezone
   - `DB_PASSWORD` - Generate a random string. Please use only the characters `A-Za-z0-9`.
4. Run `docker compose up -d`.
5. Approve the machine in your Tailscale Admin Console. You may skip this if you turned of Device Approvals.
6. Copy the machine's address (e.g. `immich.xxx.ts.net`) and enter in your browser.
7. Follow the instructions setting up Immich for the first time.

## Notes

- You don't need to proxy this service since Tailscale is running as a sidecar. If you ever need to proxy, you can update the docker-compose file to expose the Immich port under the Tailscale service or completely remove Tailscale and expose the ports under the Immich service.
- I recommend enabling the Storage Template feature. This will make your more organized comapred to the default which is difficult to navigate.
- All of the data will be stored in [/.docker-data/immich-server](../.docker-data/immich-server) directory if you didn't change the variables pointing here. You can use it for backup and restore.

## Links

- https://immich.app
- https://docs.immich.app/install/docker-compose
