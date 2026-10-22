FROM node:20-alpine

WORKDIR /app

# 安装 git 并拉取 SillyTavern 代码
RUN apk add --no-cache git
RUN git clone --depth=1 --branch release https://github.com/SillyTavern/SillyTavern.git .

# 安装依赖
RUN npm install

# 复制自定义配置文件
COPY config.yaml /app/config.yaml

# 暴露 8000 端口
EXPOSE 8000

# 启动命令：强制监听 0.0.0.0 和 8000 端口，并关闭白名单
CMD ["node", "server.js", "--listen", "--port", "8000", "--whitelistMode=false"]