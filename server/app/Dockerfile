# Build stage
FROM golang:1.19-alpine3.17 AS builder
WORKDIR /app
COPY ./src .
RUN go mod download
RUN go build -o server /app/server.go

# Run stage
FROM alpine:3.17
WORKDIR /app
COPY --from=builder /app/server .
EXPOSE 8080
CMD [ "/app/server" ]
