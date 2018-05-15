<template>
  <div>
    <v-btn @click="$router.go(-1)">Back</v-btn>
    <h1>{{ post.name }}</h1>
    <p>
      {{ post.content }}
    </p>


  </div>
</template>

<script>
export default {
  props: ['id'],
  computed: {
    post: function () {
      console.log(this.$route.params.id)
      return this.$store.getters.loadedLastestPost(this.$route.params.id)
    }
  }

}
</script>

<style scoped>

</style>