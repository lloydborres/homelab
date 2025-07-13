# My HomeLab

## Nginx Proxy Manager

Site: https://nginxproxymanager.com/guide

### Setup

1. Navigate to ./nginx-proxy-manager
2. Run docker compose up -d
3. Open a browser and navigate to http://127.0.0.1:81
4. Change the default email and password

#### Default Admin User

```
Email:    admin@example.com
Password: changeme
```

## Journey Sync Self Hosted

Site: https://journey-cloud.github.io/self-hosted-boilerplate/docker-compose-windows

## Setup

1. Run the `docker compose pull`
2. Run `docker compose up -d`

`docker exec -it journey-sync-ts tailscale serve status`