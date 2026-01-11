# Nginx Proxy Manager (with Cloudflare Tunnel)

Nginx with Cloudflare Tunnel can be used to reverse proxy requests from your custom domain to your server applications making it accessible to the public internet.

Example:

```
yourdomain.com -> Cloudflare Tunnel -> Nginx -> App 1 (localhost:5173)
                                             -> App 2 (localhost:3001)
```

With this setup, you can set `app1.yourdomain.com` to point to `:5173` and `app2.yourdomain.com` to `:3001`.

## Setup

1. Open a terminal and navigate to this [directory](/nginx-proxy-manager/).
2. Create an `.env` file based from [.env.example](.env.example).
3. Update the following variables in your recently created `.env` file.
   - `CF_TUNNEL_TOKEN`
     1. Create a [Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/get-started/create-remote-tunnel/).
     2. When choosing an environment, just simply get the token and set it to the `.env` above.
4. Run `docker compose up -d`
5. Open a browser and navigate to http://localhost:81
6. Change the default email and password. The default password can be found in your `.env` file.
7. Start setting proxies accordingly. You can also use SSL Certificates using Let's Encrypt by generating an API Token in from your Cloudflare Account and add in Nginx to use https.

## Notes

- If you didn't change the `NPM_DATA_LOCATION` variable, all of your data will be stored in [/.docker-data/nginx-proxy-manager](../.docker-data/nginx-proxy-manager) directory. You can use it for backup and restore.

## Links

- https://nginxproxymanager.com/guide/#quick-setup