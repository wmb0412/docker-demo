# 使用 Nginx 官方镜像作为基础镜像
FROM nginx:latest

# 删除默认的 Nginx 静态文件
RUN rm -rf /usr/share/nginx/html/*

# 复制前端项目构建产物到 Nginx 静态文件目录
COPY dist/ /usr/share/nginx/html

# 暴露 Nginx 的 80 端口
EXPOSE 80

# 启动 Nginx 服务器
CMD ["nginx", "-g", "daemon off;"]
