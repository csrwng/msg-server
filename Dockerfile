FROM registry.ci.openshift.org/openshift/release:golang-1.19 as builder

WORKDIR /msg-server

COPY . .

RUN cd /msg-server && go build -o ./msg-server .

FROM quay.io/openshift/origin-base:4.14
COPY --from=builder /msg-server /usr/bin/msg-server

ENTRYPOINT ["/usr/bin/msg-server"]
