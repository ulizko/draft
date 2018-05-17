<template>
  <v-layout row justify-center>
    <v-dialog v-model="dialog" persistent max-width="500px">
      <form @submit.prevent="onSubmit">
        <v-card>
          <v-card-title>
            <span class="headline">Category</span>
          </v-card-title>
          <v-card-text>
            <v-layout row v-if="errors">
              <v-flex xs12>
                <v-alert collor='error' dismissible @input="onClose" :value="true">
                  <p v-for="(error, i) in errors" :key='i'>{{ error }}</p>
                </v-alert>
              </v-flex>
            </v-layout>
            <v-layout row>
              <v-flex>
                <v-layout row>
                  <v-flex xs12>
                    <v-text-field
                      name="category[name]"
                      label="Name"
                      id="name"
                      v-model="selectedCategory.name"
                      required></v-text-field>
                  </v-flex>
                </v-layout>
                <v-layout row>
                  <v-flex xs12>
                    <v-text-field
                      name="category[description]"
                      label="Description"
                      id="description"
                      v-model="selectedCategory.description"
                      multi-line
                      required></v-text-field>
                  </v-flex>
                </v-layout>
              </v-flex>
            </v-layout>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" flat @click.native="dialog = false">Close</v-btn>
            <v-btn color="blue darken-1" flat type="submit">Save</v-btn>
          </v-card-actions>
        </v-card>
      </form>
    </v-dialog>
  </v-layout>
</template>


<script>
export default {
  props: [ 'category', 'action'],
  data () {
    return {
      selectedCategory: {}
    }
  },
  computed: {
    errors: function() {
      return this.$store.getters.errors;
    },
    dialog: {
      get: function() {
        return this.$store.getters.dialog;
      },
      set: function(value) {
        this.$store.commit('setDialog', value)
      }
    }
  },
  watch: {
    dialog: function(newVal) {
      if (!newVal) {
        this.name = "";
        this.description = "";
      }
    },
    category: function(newCategory) {
      this.selectedCategory = {
        ...newCategory
      }
    }
  },
  methods: {
    onClose: function() {
      this.$store.commit('clearError')
    },
    onSubmit: function() {
      const categoryData = {
        name: this.selectedCategory.name,
        description: this.selectedCategory.description,
        id: this.selectedCategory.id
      }
      if (this.action === 'create') {
        this.$store.dispatch('createCategory', categoryData)
      } else if (this.action === 'update') {
        this.$store.dispatch('updateCategory', categoryData)
      }
    }
  }
}
</script>
