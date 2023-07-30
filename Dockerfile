FROM node:latest
COPY package.json /
RUN npm i
RUN ls ./
RUN npm run build

FROM nginx:latest
# 这里的dist/目录是你的项目打包后的文件目录
COPY ./dist/ /usr/share/nginx/html/
COPY ./nginx.conf /etc/nginx/conf.d/

EXPOSE 80
