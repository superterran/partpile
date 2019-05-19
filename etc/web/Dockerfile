FROM nginx:latest
COPY nginx.conf /etc/nginx/conf.d/partpile.template
RUN /bin/bash -c "envsubst < /etc/nginx/conf.d/partpile.template > /etc/nginx/conf.d/partpile.conf"
