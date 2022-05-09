FROM nginx:1.21.6

COPY nginx/nginx.conf /etc/nginx/nginx.conf
WORKDIR /usr/share/nginx/html

COPY ./export .

RUN nginx -t
CMD ["nginx", "-g", "daemon off;"]
