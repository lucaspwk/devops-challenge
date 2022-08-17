# Build image
FROM golang:1.19-alpine3.16 AS build

WORKDIR /tmp/app

COPY . .

RUN go mod download && go mod tidy

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build ./cmd/ops-test-app


# Final image
FROM alpine:3.16.2 as base

COPY --from=build /tmp/app/ops-test-app /usr/bin

RUN adduser -D test-app && chown test-app:test-app /usr/bin/ops-test-app

USER test-app

CMD ["ops-test-app"]