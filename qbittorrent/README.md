# qBittorrent

**qBittorrent original docker compose (but not used here):** https://github.com/qbittorrent/docker-qbittorrent-nox/blob/main/docker-compose.yml

**Gluetun source:** https://github.com/qdm12/gluetun

## Initial Setup

1. Create an `.env` file based from [.env.example](.env.example)
2. Update necessary values
3. Open a terminal and navigate to this directory

   ```bash
   cd qbittorrent
   ```

4. Start containers (in the background and leaves them running).

   ```bash
   docker compose up -d
   ```

5. Approve the machine in your Tailscale Admin Console.
6. Copy the machine's address (e.g. `torrent.xxx.ts.net`) and enter in your browser.
7. In the terminal, check the logs to get the credentials for intial login

   ```bash
   docker logs torrent_qbittorrent
   ```

8. Back to the web page and login with the credentials.
