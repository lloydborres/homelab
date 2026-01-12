# Use the latest LTS version of Node.js
FROM node:24-alpine
 
# Set the working directory inside the container
WORKDIR /app
 
# Copy package.json and package-lock.json
COPY package*.json ./
 
# Install dependencies
RUN npm install

# Install to serve static files
RUN npm i -g serve
 
# Copy the rest of your application files
COPY . .

# Production build
RUN npm run build

# Expose the port your app runs on
# EXPOSE 5173
EXPOSE 3000
 
# Define the command to run your app
# CMD ["npm", "run", "dev"]

CMD [ "serve", "-s", "dist" ]