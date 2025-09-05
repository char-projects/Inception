FROM golang:1.18-alpine
  
COPY *.go /srcs/

RUN go build -o /srcs/helloworld /srcs/*.go

CMD ["/srcs/helloworld"]


# FROM debian:latest

# RUN apt update && apt upgrade && apt install -y \
#    nginx

# CMD ["nginx", "-g", "daemon off;"]