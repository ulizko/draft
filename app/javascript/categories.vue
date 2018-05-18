<template>
  <v-container>
    <v-layout row wrap>
      <v-flex>
        <category-form :category="selectedCategory" :action="action"></category-form>
        <v-btn flat class="primary" @click.native.stop="dialog = true">Add category</v-btn>
        <div v-for="(category, index) in categories" :key="category.id">
          <v-card class="my-3" hover>
            <v-card-title primary-title>
              <div>
                <div class="headline">{{ category.name }}</div>
                <span class="secondary--text">
                  Posts:
                  <router-link :to="{ name: 'Category', params: { id: category.id }}">
                    {{ postsCounts[index] }}
                  </router-link>
                </span>
              </div>
            </v-card-title>
            <v-card-text>
              {{ category.description }}
            </v-card-text>
            <v-card-actions>
              <v-btn flat color="success" @click="setCategory(index)">Edit</v-btn>
              <v-btn flat color="error" @click="destroyCategory(category.id, index)">Destroy</v-btn>
              <v-spacer></v-spacer>
              <v-btn flat class="blue--text" :to="{ name: 'Category', params: { id: category.id }}">Go To Category</v-btn>
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
    data: function(){
      return {
        selectedCategory: {},
        action: 'create'
      }
    },
    components: { CategoryForm },
    computed: {
      categories: function() {
        return this.$store.state.categories;
      },
      postsCounts: function() {
        return this.categories.map((category) => category.posts.length)
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
          this.selectedCategory = {};
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
      },
      setCategory: function(index) {
        this.selectedCategory = this.categories[index];
        this.action = 'update';
        this.dialog = true;
      }
    }
  }
</script>