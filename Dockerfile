FROM node:20-alpine

WORKDIR /app

# 安装 git 并拉取 SillyTavern 稳定版代码
RUN apk add --no-cache git
RUN git clone --depth=1 --branch release https://github.com/SillyTavern/SillyTavern.git .

# 安装依赖
RUN npm install

# 复制配置文件
COPY config.yaml /app/config.yaml

# 暴露 8000 端口
EXPOSE 8000

# 启动服务（加上 --listen 允许全网卡监听，加上 --whitelistMode=false 关闭域名拦截）
CMD ["node", "server.js", "--listen", "--whitelistMode=false"]