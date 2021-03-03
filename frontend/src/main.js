import Vue from 'vue'
import VueMeta from 'vue-meta'
import App from './App.vue'
import vuetify from './plugins/vuetify';
import i18n from './plugins/i18n'
import router from './router'
import {Store} from 'gofer-vue'
import './views/iconView'

Vue.use(VueMeta)
Vue.config.productionTip = false

new Vue({
    i18n,
    vuetify,
    router,
    Store,
    render: h => h(App)
}).$mount('#app')
