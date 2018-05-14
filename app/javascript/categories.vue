<template>
  <v-container>
    {{ categories }}
  </v-container>
</template>

<script>
  export default {
    data: function() {
      return {
        categories: []
      }
    },
    beforeMount: function() {
      fetch('/api/categories.json')
      .then((response) => response.json())
      .then((data) => {
        this.categories = data;
      });
    }

  }
</script>