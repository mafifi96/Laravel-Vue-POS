import './bootstrap';


import { createApp } from 'vue/dist/vue.esm-bundler'

import { getActiveLanguage, i18nVue } from 'laravel-vue-i18n';

import App from './App.vue'

import router from './routes'

import store from './store'

import './assets'

const app = createApp({
    components :{
        App
    }
})



app.use(i18nVue, {
    lang: store.getters.getLang ,
    resolve: lang => import(`../../lang/${lang}.json`),
})

app.use(router).use(store).mount("#app")
