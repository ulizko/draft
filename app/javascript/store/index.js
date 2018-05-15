import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import VueResource from 'vue-resource'

Vue.use(Vuex)
Vue.use(VueResource)

export const store = new Vuex.Store({
  state: {
    categories: [],
    lastestPosts: [],
    errors: null
  },
  getters: {
    loadedCategory: function(state) {
      return (categoryId) => {
        return state.categories.find((category) => {
          return category.id == categoryId
        })
      }
    },
    loadedLastestPost: function(state) {
      return (postId) => {
        return state.lastestPosts.find((post) => {
          return post.id == postId
        })
      }
    },
    errors: function (state) {
      return state.errors;
    }
  },
  mutations: {
    loadCategories: function(state, payload) {
      state.categories = payload;
    },
    loadLastestPosts: function(state, payload) {
      state.lastestPosts = payload;
    },
    createPost: function(state, payload) {
      state.lastestPosts.unshift(payload)
    },
    setError: function(state, payload) {
      state.errors = payload
    },
    clearError: function(state, payload) {
      state.errors = null;
    }
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
          commit('createPost', response.body)
          Vue.router.push('/')
      })
        .catch((errors) => {
          commit('setError', errors.body)
          console.log(errors)
        })
      }
  }
})