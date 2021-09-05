FROM golang:1.16.0-alpine3.13

WORKDIR /app

COPY fullcycle.go /app

RUN go build fullcycle.go

FROM alpine:3.13

COPY --from=0 "/app/fullcycle" fullcycle

ENTRYPOINT ./fullcycle

