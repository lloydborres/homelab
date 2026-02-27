# Setup Server

## 1.1 Build the machine

Maybe you have some old laptop or PC spare parts lying around you can build on top. It doesn't have to be powerful.

## 1.2 Install Linux

I personally chose Debian 13 Headless but there are other options as well. You can check out my [Debian guide](https://github.com/lloydborres/linux-guide/blob/main/Distros/Debian.md) for some ideas on how to install it.

## 1.3 SSH (Optional)

Once Linux is successfully installed, I recommend setting up and connecting through SSH to access the server remotely especially if you're running it headless.

## 1.4 Install Docker

Only needed Docker Engine since I'm running Debian as headless server.

https://docs.docker.com/engine/install/debian/#install-using-the-repository

## 1.5 Install Tailscale

**Official website:** https://tailscale.com

**Original docker compose:** https://tailscale.com/kb/1282/docker#code-examples

> You can sign up to Tailscale using the available providers. If you choose to sign up with OIDC you can self-host [Authentik](/authentik/README.md#integrating-authentik-with-tailscale-via-oidc).

<br />

[**Next: Setup Reverse Proxy**](./2%20Setup%20Reverse%20Proxy.md)
