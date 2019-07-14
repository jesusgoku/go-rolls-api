FROM golang:1.12.7-alpine AS builder

WORKDIR /go/src/app
COPY . .

RUN apk add --no-cache curl git mercurial \
    && curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh \
    && dep ensure -v \
    && apk del curl git mercurial

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix gco -o ./bin/rolls-api ./src/main.go


FROM alpine:3.10
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/app/bin/rolls-api .
CMD ["./rolls-api"]
