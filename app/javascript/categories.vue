<template>
  <v-container fluid>
    <v-layout column wrap>
      <v-flex>
        <div v-for="category in categories" :key="category.id">
          <v-card class="my-3" hover>
            <v-card-title class='headline'>
              {{ category.name }}
            </v-card-title>
            <v-card-text>
              {{ category.description }}
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn flat class="blue--text" :to="'/categories/' + category.id">Read More</v-btn>
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
      categories: function() {
        return this.$store.state.categories;
      }
    },
    beforeCreate: function () {
      this.$http.get('/api/categories.json')
        .then((response) => {
          console.log(response.body)
          this.$store.commit('loadCategories', response.body)
        })
    },
  }
</script>