<template>
  <v-container>
    <v-layout row>
      <v-flex xs12 sm6 offset-sm3>
        <h4>Create Post</h4>
      </v-flex>
    </v-layout>
    <v-layout row v-if="errors">
      <v-flex xs12 sm6 offset-sm3>
        <v-alert collor='error' dismissible @input="onClose" :value="true">
          <template v-for="error in errors">
            <v-card flat dark color="error">
              <v-card-title class="title">Oops! {{ error }}</v-card-title>
            </v-card>
          </template>
        </v-alert>
      </v-flex>
    </v-layout>
    <v-layout row>
      <v-flex xs12>
        <form @submit.prevent="onCreatePost">
          <v-layout row>
            <v-flex xs12 sm6 offset-sm3>
              <v-text-field
                name="post[name]"
                label="Name"
                id="name"
                v-model="name"
                required></v-text-field>
            </v-flex>
          </v-layout>
          <v-layout row>
            <v-flex xs12 sm6 offset-sm3>
              <v-text-field
                name="post[content]"
                label="Content"
                id="content"
                v-model="content"
                multi-line
                required></v-text-field>
            </v-flex>
          </v-layout>
          <v-layout row>
            <v-flex xs12 sm6 offset-sm3>
              <v-text-field
                name="post[category_id]"
                label="Category"
                id="category"
                v-model="categoryId"
                required>
              </v-text-field>
            </v-flex>
          </v-layout>
          <v-layout row>
            <v-flex xs12 sm6 offset-sm3>
              <v-btn
                class="primary"
                type="submit">Create Meetup</v-btn>
            </v-flex>
          </v-layout>
        </form>
      </v-flex>
    </v-layout>


  </v-container>
</template>

<script>
export default {
  data () {
    return {
      name: '',
      content: '',
      categoryId: '',
    }
  },
  computed: {
    errors: function() {
      return this.$store.getters.errors;
    }
  },
  methods: {
    onClose: function() {
      this.$store.commit('clearError')
    },
    onCreatePost: function() {
      const postData = {
        name: this.name,
        content: this.content,
        categoryId: this.categoryId
      }
      this.$store.dispatch('createPost', postData)
      // if (this.errors === null) {
      //   this.$router.push('/')
      // }
    }
  }
}
</script>

<style scoped>

</style>