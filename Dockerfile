# Build: docker build -t julienbreux/tuto-go-docker-ms:latest .

FROM golang:1.9-alpine as builder
WORKDIR /go/src/github.com/JulienBreux/tuto-go-docker-ms/
RUN apk --update add ca-certificates
# RUN go get -d -v golang.org/x/net/html
COPY app.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM scratch
ENV PATH=/bin
WORKDIR /root/
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /go/src/github.com/JulienBreux/tuto-go-docker-ms/app .
CMD ["./app"]
