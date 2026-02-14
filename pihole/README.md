# Pi-hole (with Tailscale)

Pi-hole is a software that blocks ads and trackers across your entire network.

With Tailscale, you can access your Pi-hole from anywhere, as long as you’re connected to your tailnet and you can set it as one of your Nameservers in Tailscale.

Running Tailscale as a sidecar isolates the service in its own machine, allowing you to access Pi-hole directly without specifying a port.

## Pi-hole Initial Setup

1. Open a terminal and navigate to this [directory](/pihole/).
2. Create an `.env` file based from [.env.example](.env.example).
3. Update the following variables in your recently created `.env` file:
   - `TS_HOSTNAME` - Sets a hostname for your machine in Tailscale. e.g. setting this to `pihole` you'll be able to access the web app through `pihole.xxx.ts.net`.
   - `TS_AUTHKEY` - Generate an Auth key under [Tailscale Admin Console Settings](https://login.tailscale.com/admin/settings/keys). A Tag must be applied. If you don't have a tag created yet, please see [Creating a Tag in Tailscale](../README.md#creating-a-tag-in-tailscale).
4. Run `docker compose up -d`.
5. Approve the machine in your Tailscale Admin Console. You may skip this if you turned of Device Approvals.
6. In your terminal, set a password for your dashboard by running
   ```
   docker exec -it pihole_server pihole setpassword
   ```
7. Copy the machine's address, append `/admin` (e.g. `pihole.xxx.ts.net/admin`) and enter in your browser.
8. Login through the dashboard and do configurations from there.
9. To use Pi-hole as an ad blocker withing your Tailnet, get the Tailscale IP from the Admin Console and Add it as a nameserver under the [DNS](https://login.tailscale.com/admin/dns) tab. Toggle on the Override DNS servers option.
   > Note: You'll need this service to be always running if you toggle on the override DNS server option. If the service is stopped, users within your Tailnet will not be able to connect to the internet unless they set it in their end to not use the DNS from the Tailnet.

## Notes

- If you also need Pi-hole in your local network that are not in your Tailnet, you'll need to expose the necessary ports and update each devices DNS to point to your machine's IP address. Make sure to set your machine's IP address that is running Pi-hole to a static IP or you'll end up updating the DNS everytime it changes.
- All of the data will be stored in [/.docker-data/pihole](../.docker-data/pihole) directory if you didn't change the variables pointing here. You can use it for backup and restore.

## Links

- https://pi-hole.net/
- https://github.com/pi-hole/docker-pi-hole/#running-pi-hole-docker
