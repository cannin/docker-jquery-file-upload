# docker-jquery-file-upload

Upload using: https://github.com/blueimp/jQuery-File-Upload

# Build
```
docker build -t cannin/jquery-file-upload .
```

# Run
```
docker pull cannin/jquery-file-upload
docker rm -f fs; docker run --name=fs -p 80:80 -v PATH:/var/www/upload/server/php/files cannin/jquery-file-upload /usr/bin/supervisord
docker exec -it fs bash
```
