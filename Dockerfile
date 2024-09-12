# Use an official Node runtime as a parent image  
FROM node:20-alpine  

# Set the working directory to /app inside the container  
WORKDIR /app  

# Copy the package.json and package-lock.json to the working directory  
COPY package*.json ./  

# Install dependencies  
RUN npm install  

# Copy the rest of the application code to the working directory  
COPY . .  

# Build the application for production  
RUN npm run build  

# Install a lightweight web server to serve the React application  
RUN npm install -g serve  

# Expose port 3000 to the outside world  
EXPOSE 3000  

# Command to run the app when the container starts  
CMD ["serve", "-s", "build", "-l", "3000"]  