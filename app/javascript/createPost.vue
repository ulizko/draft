<template>
  <v-container>
    <v-layout row>
      <v-flex xs12 sm6 offset-sm3>
        <h4>Create Post</h4>
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
  methods: {
    onCreatePost: function() {
      const headers = {
        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
      }
      const data = {
        post: {
          name: this.name,
          content: this.content,
          category_id: this.categoryId
        }
      }
      this.$http.post('/api/posts.json', data, { headers }).then((response) => {
        console.log(response)
        this.$router.push('/')
      })
    }
  }
}
</script>

<style scoped>

</style>