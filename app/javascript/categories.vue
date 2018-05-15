<template>
  <v-container>
    {{ categories }}
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