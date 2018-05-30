<template>
  <v-container fluid>
    <v-layout column wrap>
      <v-flex>
        <div v-for="post in posts" :key="post.id">
          <v-card class="my-3" hover>
            <v-card-title class='headline'>
              {{ post.name }}
            </v-card-title>
            <v-card-text>
              {{ post.content }}
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn flat class="blue--text" :to="'/posts/' + post.id">Read More</v-btn>
            </v-card-actions>
          </v-card>
        </div>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  computed: {
    posts: function() {
      return this.$store.state.lastestPosts;
    }
  }
}
</script>

<style scoped>

</style>