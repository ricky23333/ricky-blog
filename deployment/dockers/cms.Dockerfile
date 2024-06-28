FROM node:16.19.0 AS builder

# 将容器的工作目录设置为/app(当前目录，如果/app不存在，WORKDIR会创建/app文件夹)
WORKDIR /app 

# # 安装 Python 3.9 和相关依赖
# RUN apt-get update && \
#     apt-get install -y python3=3.9.10 python3-pip && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

# ENV PYTHONUNBUFFERED=1

COPY packages/cms /app
RUN rm -rf node_modules
RUN yarn install
RUN npm run build:prod 

#指定nginx配置项目，--from=builder 指的是从上一次 build 的结果中提取了编译结果
FROM nginx

#将打包后的文件复制到nginx中
COPY --from=builder app/dist /usr/share/nginx/html/

#用本地的 default.conf 配置来替换nginx镜像里的默认配置。
COPY ./deployment/dockers/cms-nginx-default.conf /etc/nginx/conf.d/default.conf

#暴露容器端口
EXPOSE 80
