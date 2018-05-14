<template>
  <v-app>
    <v-navigation-drawer app temporary v-model="sideBar">
      <v-list>
        <v-list-tile to="/categories">
          <v-list-tile-content>
            <v-list-tile-title>Categories</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile to='/posts'>
          <v-list-tile-content>
            <v-list-tile-title>Posts</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile to="/categories/1">
          <v-list-tile-content>
            <v-list-tile-title>Category</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
        <v-list-tile to="/posts/1">
          <v-list-tile-content>
            <v-list-tile-title>Post</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar app>
      <v-toolbar-side-icon
        @click.stop="sideBar = !sideBar"
        class="hidden-sm-and-up "></v-toolbar-side-icon>
      <v-toolbar-title>
        <router-link to="/" tag="span" style="cursor: pointer">BlogMass</router-link>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items class="hidden-xs-only">
        <v-btn flat to="/categories">Categories</v-btn>
        <v-btn flat to='/post/new'>Create post</v-btn>
      </v-toolbar-items>
    </v-toolbar>
    <v-content>
      <router-view></router-view>
    </v-content>
  </v-app>
</template>

<script>
export default {
  data: function () {
    return {
      sideBar: false
    }
  }
}
</script>

<style scoped>

</style>
