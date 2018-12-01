# Aria2 with AriaNg

Forked from [XUJINKAI/aria2-with-webui](https://github.com/XUJINKAI/aria2-with-webui) and replace [WebUI-Aria2](https://github.com/ziahamza/webui-aria2) with [AriaNg](https://github.com/mayswind/AriaNg).

## How to Use

### Docker

1. **IMPORTANT:** Customize `<DOWNLOAD_DIR>` and `<CONFIG_DIR>` to persist your data and config on your host, and `<YOUR_SECRET_CODE>` as the `rpc-secret` for remote downloading trigger.

```bash
$ sudo docker run -d \
    --name aria2-with-ariang \
    -p 6800:6800 \
    -p 6880:80 \
    -p 6888:8080 \
    -v <DOWNLOAD_DIR>:/data \
    -v <CONFIG_DIR>:/conf \
    -e SECRET=<YOUR_SECRET_CODE> \
    murray-liang/aria2-with-ariang
```

2. Visit `ArigNG` GUI on `http://<HOST_IP>:6880` and `http://<HOST_IP>:6888` to browse data folder.

### Docker Compose

1. Prepare the `docker-compose.yml` file.

**IMPORTANT:** Customize `<DOWNLOAD_DIR>` and `<CONFIG_DIR>` to persist your data and config on your host, and `<YOUR_SECRET_CODE>` as the `rpc-secret` for remote downloading trigger.

Example of `docker-compose.yml`
```yml
aria2:
    container_name: Aria2
    image: quay.io/murray-liang/aria2-with-ariang:latest
    ports:
      - 6800:6800
      - 6880:80
      - 6888:8080
    volumes:
      - <DOWNLOAD_DIR>:/data
      - <CONFIG_DIR>:/conf
    restart: unless-stopped
```

2. Bring the service up.

```bash
# Run this under the folder where `docker-compose.yml` locates
$ sudo docker-compose up -d
```

3. Visit `ArigNG` GUI on `http://<HOST_IP>:6880` and `http://<HOST_IP>:6888` to browse data folder.


## How to Build
```bash
$ sudo docker build -f Dockerfile -t quay.io/murray-liang/aria2-with-ariang .
```
