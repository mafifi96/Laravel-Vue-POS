import './assets'

import './bootstrap';

import { createApp , defineAsyncComponent} from 'vue/dist/vue.esm-bundler'

import { getActiveLanguage, i18nVue } from 'laravel-vue-i18n';

import App from './App.vue'
//import TableSkeleton from './Components/inc/TableSkeleton.vue'

import router from './routes'

import store from './store/index.js'

const app = createApp({
    components :{
        App
    }
})


app.use(i18nVue, {
    lang: store.getters.getLang ,
    resolve: lang => import(`../../lang/${lang}.json`),
})

app.component('skeleton',defineAsyncComponent(()=> import('./Components/inc/TableSkeleton.vue')))
app.component('spinner',defineAsyncComponent(()=> import('./Components/inc/Spinner.vue')))
app.component('errors',defineAsyncComponent(()=> import('./Components/inc/ValidationErrors.vue')))



app.use(store).use(router).mount("#app")

