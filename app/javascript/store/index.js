import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import VueResource from 'vue-resource'

Vue.use(Vuex)
Vue.use(VueResource)

export const store = new Vuex.Store({
  state: {
    categories: [],
    lastestPosts: [],
    errors: null,
    showForm: false
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
    },
    showForm: function(state) {
      return state.showForm;
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
    createCategory: function(state, payload) {
      state.categories.unshift(payload);
    },
    setError: function(state, payload) {
      state.errors = payload
    },
    clearError: function(state, payload) {
      state.errors = null;
    },
    setShowForm: function(state, payload) {
      state.showForm = payload;
    },
    destroyCategory: function(state, payload) {
      state.categories.splice(payload, 1)
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
      },
    createCategory: function ({ commit, getters }, payload) {
      const category = {
        name: payload.name,
        descriprion: payload.descriprion
      }
      Vue.http.post('/api/categories.json', { category })
        .then((response) => {
          commit('createCategory', response.body)
          commit('setShowForm', false)
          // Vue.router.push('/')
        })
        .catch((errors) => {
          commit('setError', errors.body)
          console.log(errors)
        })
    },
    destroyCategory: function({ commit, getters }, payload) {
      const category = getters.loadedCategory(payload)
      Vue.http.delete(`/api/categories/${payload.categoryId}.json`)
        .then((response) => {
          commit('destroyCategory', payload.index)
        })
        .catch((errors) => {
          commit('setError', errors.body)
          console.log(errors)
        })
    }
  }
})