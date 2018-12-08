# Aria2 with AriaNg

Forked from [XUJINKAI/aria2-with-webui](https://github.com/XUJINKAI/aria2-with-webui) and replace [WebUI-Aria2](https://github.com/ziahamza/webui-aria2) with [AriaNg](https://github.com/mayswind/AriaNg).

## How to Use

### Docker

1. **IMPORTANT:** Customize below settings:
    - `<CONFIG_DIR>` to persist your `aria2` config on the host.
    - `<DOWNLOADS_DIR>` to persist what you download.
    - _[Optional]_ `<MOVIES_DIR>` to persist the movies you download. If not set, `<DOWNLOADS_DIR>/movies` will be used.
    - _[Optional]_ `<TMP_DOWNLOAD>` to store what you download temporarily. The data is moved to `<DOWNLOADS_DIR>` or `<MOVIES_DIR>` when finishes. If not set, path `/tmp_download` inside container will be used.
    - `<YOUR_SECRET_CODE>` as the `rpc-secret` for remote downloading trigger.

```bash
$ sudo docker run -d \
    --name aria2-with-ariang \
    --user 1000:1000 \
    -p 6800:6800 \
    -p 6880:6880 \
    -p 6888:8080 \
    -v <CONFIG_DIR>:/conf \
    -v <DOWNLOADS_DIR>:/downloads \
    -v <MOVIES_DIR>:/downloads/movies \
    -v <TMP_DOWNLOAD>:/tmp_download \
    -e SECRET=<YOUR_SECRET_CODE> \
    quay.io/murray_liang/aria2-with-ariang
```

2. Visit `ArigNG` GUI on `http://<HOST_IP>:6880` and `http://<HOST_IP>:6888` to browse data folder.

### Docker Compose

1. Prepare the `docker-compose.yml` file.

**IMPORTANT:** Customize below settings:

- `<CONFIG_DIR>` to persist your `aria2` config on the host.
- `<DOWNLOADS_DIR>` to persist what you download.
- _[Optional]_ `<MOVIES_DIR>` to persist the movies you download. If not set, `<DOWNLOADS_DIR>/movies` will be used.
- _[Optional]_ `<TMP_DOWNLOAD>` to store what you download temporarily. The data is moved to `<DOWNLOADS_DIR>` or `<MOVIES_DIR>` when finishes. If not set, path `/tmp_download` inside container will be used.
- `<YOUR_SECRET_CODE>` as the `rpc-secret` for remote downloading trigger.

Example of `docker-compose.yml`
```yml
aria2:
    container_name: aria2
    image: quay.io/murray_liang/aria2-with-ariang:latest
    ports:
      - 6800:6800
      - 6880:6880
      - 6888:8080
    volumes:
      - <CONFIG_DIR>:/conf
      - <DOWNLOADS_DIR>:/downloads
      - <MOVIES_DIR>:/downloads/movies
      - <TMP_DOWNLOAD>:/tmp_download
    environment:
      - SECRET=<YOUR_RPC_SECRET>
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
$ sudo docker build -f Dockerfile -t quay.io/murray_liang/aria2-with-ariang .
```

## Tips

### Set `bt-tracker` to `trackers_best` of [this repo](https://github.com/ngosang/trackerslist)
