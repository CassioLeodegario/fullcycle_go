FROM golang:1.16.0-alpine3.13 as app

WORKDIR /app

COPY . .

RUN go build -ldflags "-s -w" fullcycle.go

FROM scratch

WORKDIR /app

COPY --from=app /app ./

ENTRYPOINT [ "./fullcycle" ]
