# pv212-asp

Create docker hub repository - publish
```
docker build -t pv212-asp-api . 
docker run -it --rm -p 4531:8080 --name pv212-asp_container pv212-asp-api
docker run -d --restart=always --name pv212-asp_container -p 4531:8080 pv212-asp-api
docker run -d --restart=always -v d:/volumes/pv212-asp/images:/app/uploading --name pv212-asp_container -p 4531:8080 pv212-asp-api
docker run -d --restart=always -v /volumes/pv212-asp/images:/app/uploading --name pv212-asp_container -p 4531:8080 pv212-asp-api
docker ps -a
docker stop pv212-asp_container
docker rm pv212-asp_container

docker images --all
docker rmi pv212-asp-api

docker login
docker tag pv212-asp-api:latest novakvova/pv212-asp-api:latest
docker push novakvova/pv212-asp-api:latest

docker pull novakvova/pv212-asp-api:latest
docker ps -a
docker run -d --restart=always --name pv212-asp_container -p 4531:8080 novakvova/pv212-asp-api

docker run -d --restart=always -v /volumes/pv212-asp/images:/app/uploading --name pv212-asp_container -p 4531:8080 novakvova/pv212-asp-api


docker pull novakvova/pv212-asp-api:latest
docker images --all
docker ps -a
docker stop pv212-asp_container
docker rm pv212-asp_container
docker run -d --restart=always --name pv212-asp_container -p 4531:8080 novakvova/pv212-asp-api
```

```nginx options /etc/nginx/sites-available/default
server {
    server_name   pv212api.itstep.click *.pv212api.itstep.click;
    client_max_body_size 200M;
    location / {
       proxy_pass         http://localhost:4531;
       proxy_http_version 1.1;
       proxy_set_header   Upgrade $http_upgrade;
       proxy_set_header   Connection keep-alive;
       proxy_set_header   Host $host;
       proxy_cache_bypass $http_upgrade;
       proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
       proxy_set_header   X-Forwarded-Proto $scheme;
    }
}


sudo systemctl restart nginx
certbot
```
