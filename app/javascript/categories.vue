<template>
  <v-container>
    <v-layout column wrap>
      <v-flex>
        <template v-if="showForm">
          <category-form>
            <v-btn flat slot="cancelButton"  @click="showForm = !showForm">Cancel</v-btn>
          </category-form>
        </template>
        <template v-else>
          <v-btn flat class="primary" @click="showForm = !showForm">Add category</v-btn>
        </template>  
        <div v-for="(category, index) in categories" :key="category.id">
          <v-card class="my-3" hover>
            <v-card-title class='headline'>
              {{ category.name }}
            </v-card-title>
            <v-card-text>
              {{ category.description }}
            </v-card-text>
            <v-card-actions>
              <v-btn flat color="success">Edit</v-btn>
              <v-btn flat color="error" @click="destroyCategory(category.id, index)">Destroy</v-btn>
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
  import CategoryForm from "./categoryForm";
  export default {
    components: { CategoryForm },
    computed: {
      categories: function() {
        return this.$store.state.categories;
      },
      showForm: {
        get: function() {
          return this.$store.state.showForm;
       },
       set: function(value) {
         this.$store.commit('setShowForm', value)
       }
      } 
    },
    beforeCreate: function () {
      this.$http.get('/api/categories.json')
        .then((response) => {
          console.log(response.body)
          this.$store.commit('loadCategories', response.body)
        })
    },
    methods: {
      destroyCategory: function(categoryId, index) {
        this.$store.dispatch('destroyCategory', { categoryId, index });
      }
    }
  }
</script>