FROM arm64v8/golang:1.16 AS builder
WORKDIR /go/src/app
ADD app.go /go/src/app/app.go
RUN go build app.go

FROM alpine:3.13
COPY --from=builder /go/src/app/app /app
CMD ["/app"]
