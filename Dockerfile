FROM golang:1.7
RUN apt update && \
	 apt install -y gettext-base

COPY server-conf/ /server-conf/
RUN mkdir -p /go/src/github.com/jewlr/hauser/ && \
	 cp /server-conf/entry.sh /usr/local/bin/entry.sh

ADD . /go/src/github.com/jewlr/hauser/
WORKDIR /go/src/github.com/jewlr/hauser/
RUN go build -o /usr/local/bin/hauser .
ENTRYPOINT ["entry.sh"]