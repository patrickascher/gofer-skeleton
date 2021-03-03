import Vue from 'vue'
import {VIcon} from 'vuetify/lib'

Vue.component('IconView', {
    props: ['value'],
    components:{
        VIcon
    },
    data: function () {
        return {
        }
    },
    template: '<v-icon>{{value}}</v-icon>'
});
