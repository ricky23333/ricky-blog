module.exports = {
  environment: "dev",
  database: {
    dbName: "ricky_blog",
    host: "database", //开发模式下使用localhost, 生产模式下使用database容器名称
    port: 3306,
    user: "mysql",
    password: "gaga!1234",
  },
  security: {
    secretKey: "secretKey",
    // 过期时间 6小时
    expiresIn: 60 * 60 * 6,
  },
};
