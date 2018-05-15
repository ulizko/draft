<template>
  <v-container fluid>
    <v-layout column wrap>
      <v-flex>
        <v-btn @click="$router.go(-1)">Back</v-btn>
        <h1>{{ category.name }}</h1>
        <p>
          {{ category.description }}
        </p>
      </v-flex>
    </v-layout>
  </v-container>
</template>

<script>
export default {
  computed: {
    category: function() {
      return this.$store.getters.loadedCategory(this.$route.params.id)
    }
  }
}
</script>

<style scoped>

</style>