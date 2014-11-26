### Building

    sudo docker build.

### Running
    
    sudo docker run -p 80:80 -v [local dir]:/var/log/php-web -v [local dir]:/var/log/php-fpm [image ID]

Replace **[local dir]** with a directory on your host where you want to view the php-fpm logs and nginx web logs

That's it!  Access your Dockerized Nginx instance at http://localhost/
