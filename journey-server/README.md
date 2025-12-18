# Journey Sync Self Hosted

Site: https://journey-cloud.github.io/self-hosted-boilerplate/docker-compose-windows

## Initial Setup

1. Create an `.env` file based from [.env.example](.env.example)
2. Update necessary values
3. Open a terminal and navigate to this directory

   ```bash
   cd journey-server
   ```

4. Start containers (in the background and leaves them running).

   ```bash
   docker compose up -d
   ```

5. Approve the machine in your Tailscale Admin Console.
6. Copy the machine's address (e.g. `journey.xxx.ts.net`) and enter in your browser.
7. Follow the instructions setting up Jellyfin for the first time.

Note: You'll need to enable funnel to allow journey.cloud to connect.
