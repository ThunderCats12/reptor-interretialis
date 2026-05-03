FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf # not needed because you are overriding it with COPY

COPY ../nginx/nginx.conf /etc/nginx/conf.d/default.conf # theoretically, this is not required as well because you are suppose to override this with mount

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"] # great work
