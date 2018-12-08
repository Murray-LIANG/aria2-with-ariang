FROM alpine:latest

LABEL maintainer="Murray <menglei.leung@gmail.com>"

RUN apk update && \
	apk add --no-cache --update bash && \
	apk add --no-cache --update aria2 && \
	apk add --no-cache curl unzip && \
	curl -s https://api.github.com/repos/mayswind/AriaNg/releases/latest \
		| grep "browser_download_url.*zip" | grep -v -i AllInOne | cut -d'"' -f4 \
		| xargs wget -O /ariang.zip && \
	unzip /ariang.zip -d /ariang && \
	rm /ariang.zip && \
	apk add --update darkhttpd

ADD files/start.sh /conf-copy/start.sh
ADD files/aria2.conf /conf-copy/aria2.conf
ADD files/on-complete.sh /conf-copy/on-complete.sh

RUN chmod +x /conf-copy/start.sh

WORKDIR /
VOLUME ["/conf", "/downloads", "/tmp_download"]
EXPOSE 6800
EXPOSE 6880
EXPOSE 8080

CMD ["/conf-copy/start.sh"]
