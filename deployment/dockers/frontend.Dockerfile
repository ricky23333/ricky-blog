# 基于镜像node，版本选择合适稳定版本即可
FROM node:16.19.0-alpine
# 参数,node的环境为生产环境
ENV NODE_ENV=production
# 任意ip
ENV HOST 0.0.0.0
# 容器内创建目录app
WORKDIR /app 
# 复制当前的内容到容器内容部目录app
COPY packages/frontend /app
RUN rm -rf node_modules
RUN yarn install
RUN npm run generate 
# 暴露端口6002，默认端口
EXPOSE 6002
# start
CMD ["npm","start"]
