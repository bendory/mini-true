FROM golang as builder
WORKDIR /go/src/true
COPY main.go ./
COPY go.mod ./
RUN go install

FROM scratch
COPY --from=builder /go/bin/true /true
CMD ["/true"]
