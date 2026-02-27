# Setup Reverse Proxy

```
app1.yourdomain.com ->                          -> App 1 (localhost:5173)
                       Cloudflare Tunnel -> NPM
app2.yourdomain.com ->                          -> App 2 (localhost:3001)
```

## 2.1 Get A Domain And Setup Cloudflare

Any registrar should work but use Cloudflare's DNS to use Cloudflare Tunnel.

## 2.2 Creating A Tag In Tailscale

Under [Access controls](https://login.tailscale.com/admin/acls/file), add the following:

```
# Sample Code
"tagOwners": {
   "tag:my-server":            ["admin@domain.com"],
   "tag:docker-container":         ["admin@domain.com"],
},
```

## 2.3 Create A Network In Docker

This will be used to allow forwarding to hostnames from Nginx Proxy Manager.

```bash
docker network create -d bridge proxy_bridge
```

## 2.4 Generating A Key In Tailscale

Under Settings > Personal Settings > [Keys](https://login.tailscale.com/admin/settings/keys), generate an Auth Key (one-time use).

- Toggle on `Tags` and add a certain tag to be applied on the specific machine (e.g. the `tag:docker-container`).
- Other settings can be left as is.

## 2.5 Nginx Proxy Manager Initial Setup

1. Open a terminal and navigate to the [npm directory](../nginx-proxy-manager/).
2. Create an `.env` file based from [.env.example](../nginx-proxy-manager/.env.example).
3. Update the following variables in your recently created `.env` file.
   - `TS_HOSTNAME` - Sets a hostname for your machine in Tailscale. e.g. setting this to `proxy` you'll be able to access the web app through https://proxy.xxx.ts.net.
   - `TS_AUTHKEY` - Please see [Generating A Key In Tailscale](#23-generating-a-key-in-tailscale).
   - `CF_TUNNEL_TOKEN`
     1. Create a [Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/get-started/create-remote-tunnel/).
     2. When choosing an environment, just simply get the token and set it to the `.env` above.
4. Run `docker compose up -d`
5. Open a browser and navigate to https://proxy.xxx.ts.net.
6. Change the default email and password. The default password can be found in your `.env` file.

## 2.6 Adding A Certificate

1. Create a Token under Cloudflare Dashboard > [My Profile](https://dash.cloudflare.com/profile/api-tokens).
2. Use Edit zone DNS template.
3. Select a domain and save.
4. In the Nginx Proxy Manager Dashboard, click Certificates and Add Certificate > Lets Encrypt via DNS
5. Fill up fields
   - Domain Names: `*.domain.tld`
   - DNS Provider: `Cloudflare`
   - Add the token generated from Cloudflare.

## 2.7 Adding A Proxy Host

1. In the Nginx Proxy Manager Dashboard, click Proxy Hosts and Add Proxy Host.
2. Fill up fields
   - Sample:
     - Domain Names: `proxy.domain.tld`
     - Scheme: `http:`
     - Forward Hostname/IP: `nginx-proxy-manager`
       - Hostname is from the `docker-compose.yml`.
     - Forward Port: `81`
     - SSL Certificate: `*.domain.tld`
       - See [Adding A Certificate](#26-adding-a-certificate).
     - Enable the following:
       - Block Common Exploits
       - Websockets Suppport
       - Force SSL

<br />

[**Previous: Setup Server**](./1%20Setup%20Server.md)
