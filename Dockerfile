#Maintainer info@sinaptika.net
#ZNC http://znc.in/
#znc image
FROM alpine:3.5

ENV \
	ZNC_VERSION=1.6.4 \
	Z_DIR=/opt/znc \
	TZ=Europe/Ljubljana \
	Z_UID=1000 \
	Z_GID=1000 \
	Z_USER=znc \
	Z_GROUP=znc \
	Z_LOG_LEVEL=warn \
	ZNC_PORT=7000

RUN \
  mkdir -p \
    ${Z_DIR} && \
  addgroup -g \
		${Z_GID} -S ${Z_GROUP} && \
	adduser \
		-h ${Z_DIR} \
		-g "ZNC system user" \
		-G ${Z_GROUP} \
		-S -D \
		-u ${Z_UID} ${Z_USER}

COPY \
  scripts/znc-entrypoint.sh /usr/bin/

RUN \
	apk add --no-cache \
    openssl tzdata && \
  apk add --no-cache \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/main \
    znc znc-extra && \
  chown \
    -R ${Z_USER}:${Z_GROUP} ${Z_DIR} && \
  chmod +x /usr/bin/znc-entrypoint.sh

EXPOSE \
  ${ZNC_PORT}

WORKDIR \
  ${Z_DIR}

USER \
  ${Z_USER}

ENTRYPOINT \
  ["/usr/bin/znc-entrypoint.sh"]

LABEL \
	net.sinaptika.maintainer="info@sinaptika.net" \
	net.sinaptika.name="znc" \
	net.sinaptika.branch="master" \
	net.sinaptika.from="alpine:3.5" \
	c_software_name="ZNC irc bouncer" \
	c_software_url="http://znc.in/" \
	image.version="0.1" \
	date.version="5.5.2017" \
	web_interface=true \
	web_interface_port=${ZNC_PORT} \
	exposed_ports=${ZNC_PORT}\
	docker_volumes=${D_DIR}
