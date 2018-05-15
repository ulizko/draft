import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'

Vue.use(Vuex)

export const store = new Vuex.Store({
  state: {
    categories: [],
    lastestPosts: []
  },
  getters: {
    loadedLastestPost: function(state) {
      return (postId) => {
        console.log(postId)
        return state.lastestPosts.find((post) => {
          console.log(post)
          return post.id == postId
        })
      }
    }
  },
  mutations: {
    loadCategories: function(state, payload) {
      state.categories = payload;
    },
    loadLastestPosts: function(state, payload) {
      state.lastestPosts = payload;
    }

  },
  actions: {

  }
})