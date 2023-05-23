# Use an official Nginx image as the base
FROM nginx:latest

# Copy the application files to the appropriate location in the container
COPY index.html /usr/share/nginx/html
COPY styles.css /usr/share/nginx/html
COPY script.js /usr/share/nginx/html

# Expose port 80 of the container
EXPOSE 80


# Copy the custom Nginx configuration
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Execute the Nginx server 
CMD ["nginx", "-g", "daemon off;"]