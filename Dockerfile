FROM golang:1.13

WORKDIR /go/src/github.com/percona/mongodb_exporter

COPY . .

RUN make build

FROM quay.io/prometheus/busybox:latest

COPY --from=0 /go/src/github.com/percona/mongodb_exporter/mongodb_exporter /bin/mongodb_exporter

EXPOSE 9216

ENTRYPOINT [ "/bin/mongodb_exporter" ]
