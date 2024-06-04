module.exports = {
  environment: 'dev',
  database: {
    dbName: 'ricky_blog',
    host: 'localhost',
    port: 3306,
    user: 'mysql',
    password: 'mysql'
  },
  security: {
    secretKey: "secretKey",
    // 过期时间 1小时
    expiresIn: 60 * 60
  }
}
