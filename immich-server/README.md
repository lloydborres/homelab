# Immich with Tailscale

Self-hosted photo and video management solution.

Easily back up, organize, and manage your photos on your own server. Immich helps you
browse, search and organize your photos and videos with ease, without sacrificing your privacy.

**Official website:** https://immich.app

**Original docker compose:** https://docs.immich.app/install/docker-compose

## Initial Setup

1. Create an `.env` file based from [.env.example](.env.example)
2. Update necessary values
3. Open a terminal and navigate to this directory

   ```bash
   cd immich-server
   ```

4. Start containers (in the background and leaves them running).

   ```bash
   docker compose up -d
   ```

5. Approve the machine in your Tailscale Admin Console.
6. Copy the machine's address (e.g. `immich.xxx.ts.net`) and enter in your browser.
7. Follow the instructions setting up Immich for the first time.
