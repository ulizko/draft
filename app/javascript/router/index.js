import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router'
import Home from '../home.vue'
import Categories from '../categories.vue'
import Category from '../category.vue'
import Posts from '../posts.vue'
import Post from '../post.vue'
import CreatePost from '../createPost.vue'
import Comments from '../comments.vue'
import Comment from '../comment.vue'


Vue.use(VueRouter)

export default new VueRouter({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: Home
    },
    {
      path: '/categories',
      name: 'Categories',
      component: Categories
    },
    {
      path: '/categories/:id',
      name: 'Category',
      component: Category
    },
    {
      path: '/posts',
      name: 'Posts',
      component: Posts
    },
    {
      path: '/posts/:id',
      name: 'Post',
      component: Post
    },
    {
      path: '/post/new',
      name: 'Create post',
      component: CreatePost
    }
  ],
  mode: 'history'
})