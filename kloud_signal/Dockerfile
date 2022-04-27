###############################################################################
# syntax=docker/dockerfile:1
###############################################################################

FROM golang:alpine AS rtsp_server
LABEL maintainer="Daniel Rosatto <danielrosatto@gmail.com>"


RUN apk update && apk add git

RUN mkdir app

WORKDIR app

RUN sh -c "git clone https://github.com/aler9/rtsp-simple-server.git ."
RUN sh -c "cat rtsp-simple-server.yml |\
 sed -i -e 's/rtspAddress: :8554/rtspAddress: :80/g' \
 -e 's/hlsAddress: :8888/hlsAddress: :443/g' rtsp-simple-server.yml"


# EXPOSE 8554
# EXPOSE 8888
EXPOSE 80
EXPOSE 443
EXPOSE 1935

RUN sh -c "go run ."
