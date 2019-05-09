FROM golang:1.12 AS build
WORKDIR /go/src/github.com/GoogleCloudPlatform/pubsubbeat
COPY . .
RUN make

FROM debian:8.11
WORKDIR /srv
COPY --from=build /go/src/github.com/GoogleCloudPlatform/pubsubbeat/pubsubbeat .
