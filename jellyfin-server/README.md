# Jellyfin with Tailscale

Jellyfin is the volunteer-built media solution that puts you in control of your media. Stream to any device from your own server, with no strings attached. Your media, your server, your way.

**Official website:** https://jellyfin.org

**Original docker compose:** https://jellyfin.org/docs/general/installation/container

## Initial Setup

1. Create an `.env` file based from [.env.example](.env.example)
2. Update necessary values
3. Open a terminal and navigate to this directory

   ```bash
   cd jellyfin-server
   ```

4. Start containers (in the background and leaves them running).

   ```bash
   docker compose up -d
   ```

5. Approve the machine in your Tailscale Admin Console.
6. Copy the machine's address (e.g. `jellyfin.xxx.ts.net`) and enter in your browser.
7. Follow the instructions setting up Jellyfin for the first time.
