<template>
  <v-container>
    <v-layout row v-if="errors">
      <v-flex xs12>
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
      <v-flex>
        <form @submit.prevent="onSubmit">
          <v-layout row>
            <v-flex xs12>
              <v-text-field
                name="category[name]"
                label="Name"
                id="name"
                v-model="name"
                required></v-text-field>
            </v-flex>
          </v-layout>
          <v-layout row>
            <v-flex xs12>
              <v-text-field
                name="category[description]"
                label="Description"
                id="description"
                v-model="description"
                multi-line
                required></v-text-field>
            </v-flex>
          </v-layout>
          <v-layout row>
            <v-flex xs12>
              <v-btn
                class="primary"
                type="submit">Save Category</v-btn>
                <slot name="cancelButton"></slot>
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
      description: ''
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
    onSubmit: function() {
      const categoryData = {
        name: this.name,
        description: this.description
      }
      this.$store.dispatch('createCategory', categoryData)
      // if (this.errors === null) {
      //   this.$router.push('/')
      // }
    }
  }
}
</script>
