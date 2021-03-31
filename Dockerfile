FROM golang:alpine3.13 as builder
WORKDIR /usr/src/app

# Install git + SSL ca certificates.
# Git is required for fetching the dependencies.
# Ca-certificates is required to call HTTPS endpoints.
RUN apk update && apk add --no-cache git ca-certificates && update-ca-certificates

# copy project
COPY . /usr/src/app

# Build the binary
# RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/arjuna

FROM alpine:3.13.2

LABEL org.opencontainers.image.source="https://github.com/arjuna-chatbot"

# Import from builder.
# COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

# Copy our static executable
# COPY --from=builder /go/bin/arjuna /go/bin/arjuna

EXPOSE 8080
# Run the arjuna binary.
# ENTRYPOINT ["/go/bin/arjuna"]