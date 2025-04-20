FROM ruby:3-alpine

ARG PROTO_CONVERT_VERSION=0.4.2
# Install dependencies
RUN apk update && \
    apk upgrade && \
    apk add --no-cache build-base protobuf protoc  && \
    gem install proto-convert -v "$PROTO_CONVERT_VERSION"

ENTRYPOINT ["proto-convert"]
