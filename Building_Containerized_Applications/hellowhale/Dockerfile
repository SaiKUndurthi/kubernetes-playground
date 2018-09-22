FROM nginx

COPY wrapper.sh /

COPY html /usr/share/nginx/html

RUN chmod 777 /usr/share/nginx/html/images
CMD ["./wrapper.sh"]
