<template>
  <v-app>
    <v-toolbar app>
      <v-toolbar-title>
        <router-link to="/" tag="span" style="cursor: pointer">BlogMass</router-link>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items>
        <v-btn flat to="/categories">Categories</v-btn>
        <v-btn flat to='/post/new'>Create post</v-btn>
      </v-toolbar-items>
    </v-toolbar>
    <v-content>
      <router-view></router-view>
    </v-content>
  </v-app>
</template>

<script>
export default {
  created: function() {
    this.loadPosts();
    this.loadCategories();
  },
  methods: {
    loadPosts: function() {
      this.$http.get('/api/posts.json')
      .then((response) => {
        this.$store.commit('loadLastestPosts', response.body)
      })
      .catch((error) => {
        console.log(error)
      })
    },
    loadCategories: function() {
      this.$http.get('/api/categories.json')
      .then((response) => {
        this.$store.commit('loadCategories', response.body)
      })
      .catch((error) => {
        console.log(error)
      })
    }
  }
}
</script>

<style scoped>

</style>
