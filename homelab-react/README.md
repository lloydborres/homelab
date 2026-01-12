# HomeLab React

Containerizing a simple React Application.

## Setup

You can run this project [normally](#running-react-app-normally) or using [docker](#building-docker-image).

### Running React App Normally

1. Open a terminal and navigate to this [directory](/homelab-react/).
2. Run `npm run install`.
3. Run `npm run dev`.
4. Open a browser and check http://localhost:5173.

### Building Docker Image

1. Open a terminal and navigate to this [directory](/homelab-react/).
2. Run `homelab-react:v0.1.0`. This will build a docker image with the name `homelab-react` and version `v0.1.0`.
3. Run `docker images` to check the list of docker images.
4. Run `docker run -p 3000:3000 homelab-react:v0.1.0` to test the image as a running container.
5. Test on the browser http://localhost:3000.
6. You can also run `docker compose up -d` instead and check http://localhost:3031.
