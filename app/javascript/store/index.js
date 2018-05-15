import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import VueResource from 'vue-resource'

Vue.use(Vuex)
Vue.use(VueResource)

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
    },
    createPost(state, payload) {
      state.loadedPosts.unshift(payload)
    },

  },
  actions: {
    createPost: function({ commit, getters }, payload) {
      const post = {
        name: payload.name,
        content: payload.content,
        category_id: payload.categoryId
      }
      Vue.http.post('/api/posts.json', { post })
        .then((response) => {
          console.log(response)
          // commit('createPost', )
      })
        .catch((error) => {
          console.log(error)
        })
      }
  }
})