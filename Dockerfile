FROM alpine:latest
CMD while true; do echo -e "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\ndate is $(date +"%m-%d-%y-%T") and ip is $(hostname -i | awk ' {print $1}')" | nc -l -p 8000; done