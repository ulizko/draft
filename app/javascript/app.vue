<template>
  <v-app>
    <v-toolbar app>
      <v-toolbar-title>BlogMass</v-toolbar-title>
      <v-spacer></v-spacer>

    </v-toolbar>
    <v-content>
      <v-container fluid>
         <v-layout column wrap align-center> 
        <v-flex xs12 sm6>
            <div v-for="post in posts" :key="post.id">
              <v-card class="my-3" hover>
                <v-card-title
                >{{ post.name }}
                  
                </v-card-title>
                <v-card-text>
                  {{ post.content }}
                </v-card-text>
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn flat class="blue--text">Read More</v-btn>
                </v-card-actions>
              </v-card>
            </div>
          </v-flex>
        </v-layout>
      </v-container>
    </v-content>
  </v-app>
</template>

<script>
export default {
  data: function () {
    return {
      posts: []
    }
  },
  beforeMount: function () {
    fetch('/posts.json')
      .then((response) => response.json())
      .then((data) => {
        this.posts = data;
      });
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
