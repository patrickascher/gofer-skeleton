FROM golang:1.16.0-buster
RUN go get github.com/gravityblast/fresh

RUN apt-get update
RUN apt-get install -y nodejs npm
RUN npm install -g npm

ADD . /go/src/github.com/patrickascher/gofer-skeleton
WORKDIR /go/src/github.com/patrickascher/gofer-skeleton
RUN go get ./...
RUN cd frontend/ && npm install

CMD bash start.sh

