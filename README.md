1.  Create a Dockerfile to build a Docker image for the web application.

        touch Dockerfile
        nano Dockerfile

    Contents of Dockerfile:

        #Use an official Nginx image as the base

        FROM nginx:latest

        #Copy the application files to the appropriate location in the container

        COPY index.html /usr/share/nginx/html
        COPY styles.css /usr/share/nginx/html
        COPY script.js /usr/share/nginx/html

        #Expose port 80 of the container

        EXPOSE 80

    contents of the index,styles and script is very2 simple at the moments:
    
    index.html:
        
        <!DOCTYPE html>
        <html>
        <head>
        <title>Simple Web App</title>
        <link rel="stylesheet" href="styles.css">
        </head>
        <body>
        <h1>Welcome to a Simple Web App</h1>
        <p>This is a basic web application.</p>
        <script src="script.js"></script>
        </body>
        </html>
        <!doctype html>
        <html>
        <head>
        <title>Main webpage Title</title>
        </head>
        <body>
        <p>This is an example paragraph. Anything in the
            <strong>body</strong>
            tag will appear on the page, just like this
            <strong>p</strong> tag and its contents.
        </p>
        </body>
        </html>

styles.css:

    body {
    background-color: #5bfd68;
    font-family: Arial, sans-serif;
    margin: 5;
    padding: 5;
    }
    h1 {
    color: #0004ff;
    }
    p {
    font-size: 16px;
    color: #ff0505;
    }

   script.js:
   
       console.log("Web app Loaded!");

2.  Set up a Docker Compose file to define the service and its configuration. Including implement container resource management using Docker Compose, eg limiting CPU and memory.

        touch docker-compose.yml
        nano docker-compose.yml

    contents of docker-compose.yml:

        version: '3'
        services:
        web: //defining a service called web
        build:
        context: .
        dockerfile: Dockerfile
        ports: - 8080:80 //maps port 8080 on the host to port 80 in the container. Allowing incoming traffic to access the service running on port 80 within the container.
        volumes:
          - ./index.html:/usr/share/nginx/html/index.html
          - ./styles.css:/usr/share/nginx/html/styles.css
          - ./script.js:/usr/share/nginx/html/script.js
        deploy:
        resources: specifies deployment configurations
        limits:
        cpus: '0.5' # Set the CPU limit to 0.5 (50% of a single CPU core)
        memory: 256M # Set the memory limit to 256MB

3.  Test the setup by running the application using Docker Compose.

        docker-compose up -d #build the docker file which will be accessed on http://167.172.69.231:8080/ as port 80 was specified earlier in the Dockerfile.
