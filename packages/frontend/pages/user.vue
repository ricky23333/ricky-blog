<template>
  <div>
    <Header />
    <div v-if="userInfo" class="userinfo">
      <p>昵称：{{ userInfo.username }}</p>
      <p>邮箱：{{ userInfo.email }}</p>
      <p style="text-indent: 2em">
        —— 假如生活欺骗了你，请你不要放弃，坚持下去！天是不会给绝路你的！
      </p>

      <div
        v-if="Array.isArray(commentList) && commentList.length > 0"
        class="comment"
      >
        <h2>评论列表：</h2>
        <ul class="comment-list">
          <li v-for="item in commentList" :key="item.id" class="comment-item">
            <p>文章：{{ item.article.title }}</p>
            <p>评论内容：{{ item.content }}</p>
            <p>评论时间：{{ item.created_at }}</p>
            <p>回复：{{ item.reply_list || '无' }}</p>
          </li>
        </ul>
        <div class="pagination">
          <el-pagination
            background
            :current-page.sync="page"
            layout="total, prev, pager, next"
            :total="count"
            @current-change="handleCurrentChange"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import Header from '@/components/common/Header'
import { getCommentTarget } from '@/request/api/comment'

export default {
  name: 'UserIndex',
  components: {
    Header,
  },
  data() {
    return {
      page: 1,
      count: 0,
      commentList: [],
    }
  },
  computed: {
    ...mapState({
      userInfo: (state) => state.user.userInfo,
    }),
  },
  async fetch({ store }) {
    await store.dispatch('category/getCategoryData')
  },
  head() {
    return {
      title: `${this.userInfo?.username} - 个人中心  - RickyBlog.com`,
      meta: [
        {
          name: 'keywords',
          content:
            '博客,ricky,rickyblog,全栈开发工程师,全栈性能优化,JavaScript,css,html,NodeJs',
        },
        {
          name: 'description',
          content: 'Ricky博客 - RickyBlog.com，专注于全栈开发技术，全栈性能优化！',
        },
      ],
    }
  },
  mounted() {
    this.getComment()
  },
  methods: {
    async getComment() {
      const uid = this.userInfo && this.userInfo.id
      const [err, res] = await getCommentTarget({
        user_id: uid,
        is_replay: 1,
        is_article: 1,
        page: this.page,
      })
      if (!err) {
        this.isLoad = true
        this.commentList = res.data.data.data
        this.count = res.data.data.meta.count
      }
    },
    // 点击数字
    async handleCurrentChange(page) {
      this.page = page
      await this.getComment()
      this.$scrollTo(0)
    },
  },
}
</script>

<style scoped lang="scss">
.userinfo {
  width: 1024px;
  margin: 32px auto;
  font-size: 14px;
}
.comment-item {
  padding: 20px 0;
  border-bottom: 1px solid #f0f0f0;
}
</style>
