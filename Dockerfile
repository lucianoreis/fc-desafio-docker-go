FROM golang:1.19-alpine3.15 as builder
WORKDIR /app
RUN go mod init lucianoreis/fullcycle
COPY . .
RUN go build -o main .

FROM scratch
COPY --from=builder /app .
CMD ["./main"]