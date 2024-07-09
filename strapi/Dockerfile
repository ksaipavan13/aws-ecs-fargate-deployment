# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory
WORKDIR /app

# Copy package.json and yarn.lock
COPY package.json ./
COPY yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application code
COPY . .

# Build the Strapi application
RUN yarn build

# Expose the port the app runs on
EXPOSE 1337

# Start the Strapi application
CMD ["yarn", "start"]


