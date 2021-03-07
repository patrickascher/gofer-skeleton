import Vue from 'vue'
import VueMeta from 'vue-meta'
import App from './App.vue'
import vuetify from './plugins/vuetify';

import router from './router'
import {I18nService, Store} from 'gofer-vue'
import './views/iconView'

Vue.use(VueMeta)
Vue.config.productionTip = false
let i18n = I18nService.i18n
// load default lang
I18nService.loadLanguageAsync("en", false)

new Vue({
    vuetify,
    i18n,
    router,
    Store,
    render: h => h(App)
}).$mount('#app')
