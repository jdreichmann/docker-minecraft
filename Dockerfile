FROM		alpine:edge
MAINTAINER	Jona Reichmann

RUN	apk update \
	&& apk upgrade \
	&& apk add \
		curl
		jq

ADD fsRoot /

CMD ["bash", "-c", "/opt/minecraft/entrypoint.sh"]
