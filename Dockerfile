FROM golang:latest AS builder
WORKDIR /go/src/app
ADD app.go /go/src/app/app.go
RUN GOOS=linux GOARCH=arm64 go build app.go

FROM alpine:3.13
COPY --from=builder /go/src/app/app /app
CMD ["/app"]
