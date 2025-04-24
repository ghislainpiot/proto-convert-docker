FROM ruby:3-alpine AS builder

ARG PROTO_CONVERT_VERSION=0.4.2
RUN apk add --no-cache build-base protobuf protoc
RUN gem install proto-convert -v "$PROTO_CONVERT_VERSION"

FROM ruby:3-alpine
COPY --from=builder /usr/bin/protoc /usr/bin/protoc
COPY --from=builder /usr/local/bundle /usr/local/bundle

ENTRYPOINT ["proto-convert"]
