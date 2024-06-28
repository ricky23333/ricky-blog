## 博客网站

基于Koa, Vue, Nuxt.js SSR 博客项目

- 技术栈：Vue.js, Nuxt.js, Vuex
- UI 框架：Element-UI
- Node.js 服务端 API 接口项目：
- 欢迎大家指导~
- backend（服务端API），cms（后台管理系统） 和 frontend（博客网站页）开发运行 请使用node 16.19.0 版本

部署
- 分别执行项目根目录下./build-XXX-docker.sh三个构建docker镜像的脚本
- 各服务端口号在docker-compose.yml内自行配置
- 然后执行<code>docker-compose up -d</code> 运行项目