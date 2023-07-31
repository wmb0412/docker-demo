# 使用官方 Node.js 镜像作为基础镜像
FROM node:latest

# 设置工作目录
WORKDIR /app

# 将前端项目文件拷贝到容器中
COPY . .

# 安装项目依赖
RUN npm install

# 构建前端项目
RUN npm run build

# 使用 Nginx 镜像作为基础镜像
FROM nginx:latest

# 删除默认的 Nginx 静态文件
RUN rm -rf /usr/share/nginx/html/*

# 复制前端项目构建产物到 Nginx 静态文件目录
COPY --from=0 /app/dist/ /usr/share/nginx/html
COPY  --from=0 /app/nginx.conf /etc/nginx/conf.d/
# 暴露 Nginx 的 80 端口
EXPOSE 80

# 启动 Nginx 服务器
CMD ["nginx", "-g", "daemon off;"]
