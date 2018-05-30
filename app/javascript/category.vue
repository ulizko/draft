<template>
  <v-container>
    <v-layout row wrap>
      <v-flex>
        <v-card class="mb-1 teal lighten-5">
          <v-container fluid>
        <v-btn small @click="$router.go(-1)">Back</v-btn>

            <v-card-title primary-title>
              <div>
                <div class="headline">{{ category.name }}</div>
                <p class="pt-3">{{ category.description }}</p>
              </div>
            </v-card-title>
            <v-layout row wrap>
              <v-flex>
                <v-card
                  class="mb-1 teal lighten-3"
                  hover
                  v-for="(post, index) in category.posts"
                  :key="index"
                >
                  <v-card-title primary-title >
                    <router-link class="title" :to="{ name: 'Post', params: { id: post.id }}"> {{ post.name }}</router-link>

                    <v-spacer></v-spacer>

                    <v-btn small color="success" >Edit</v-btn>
                    <v-btn small color="error" >Delete</v-btn>
                  </v-card-title>

                </v-card>

              </v-flex>
            </v-layout>
          </v-container>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  data: function() {
    return {
      // category: {}
    }
  },
  computed: {
    category: function() {
      return this.$store.getters.loadedCategory(this.$router.history.current.params.id);
    },
    postCount: function() {
      return this.category.posts.length;
    },
    commentsCount: function() {
      return this.category.comments.length;
    }

  },
  // beforeCreate: function() {
  //     console.log('bc')
  //     const path = this.$router.history.current.params.id;
  //     this.$http.get(`/api/categories/${path}.json`)
  //     .then((response) => {
  //       this.category = response.body;
  //     })
  //     .catch((error) => {
  //       console.log(error)
  //     })
  //   }
}
</script>

<style scoped>

</style>