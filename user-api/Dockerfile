FROM node:17.9.0-slim
LABEL maintainer="DeekshithSN"
RUN useradd userapi
WORKDIR /app
RUN chown userapi /app /home
COPY . .
RUN npm install 
EXPOSE 1004
USER userapi
ENV MONGO_URL=""
ENV ADMIN_EMAIL=""
ENV MAIL_HOST=""
ENV MAIL_PORT=""
ENV MAIL_USER=""
ENV MAIL_PASS=""
CMD ["npm","start"]