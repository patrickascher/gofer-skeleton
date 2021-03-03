<script>
import {Alert} from 'gofer-vue'

export default {
  name: 'App',
  metaInfo: {
    // if no subcomponents specify a metaInfo.title, this title will be used
    title: process.env.VUE_APP_TITLE,
    // all titles will be injected into this template
    titleTemplate: '%s | My Awesome Webapp'
  },
  components: {Alert},
  data() {
    return {
      //
    }
  }
}
</script>

<template>
  <v-app>
    <!-- <FhpLoader/>-->
    <Alert/>
    <router-view></router-view>
  </v-app>
</template>
