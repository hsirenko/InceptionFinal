FROM alpine:3.21

RUN	apk update && apk upgrade && apk add --no-cache nginx

# Copy the script from the host machine to the container
COPY ./requirements/tools/check_and_free_port.sh /usr/local/bin/check_and_free_port.sh

RUN chmod +x /usr/local/bin/check_and_free_port.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

