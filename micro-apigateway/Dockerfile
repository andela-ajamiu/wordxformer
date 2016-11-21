FROM nginx:1.10.2

RUN mkdir /data
COPY index.html /data/index.html

COPY nginx.conf /etc/nginx/conf.d/backend.conf
RUN rm /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]