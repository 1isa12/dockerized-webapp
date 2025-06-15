# Use official Node.js image
FROM node:18

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy all other files
COPY . .

# App will run on port 3000
EXPOSE 3000

# Start the app
CMD ["node", "app.js"]
