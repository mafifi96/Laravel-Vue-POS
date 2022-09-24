import './assets'
import './bootstrap';

import { createApp } from 'vue/dist/vue.esm-bundler'

import { getActiveLanguage, i18nVue } from 'laravel-vue-i18n';

import App from './App.vue'

import router from './routes'

import store from './store'


const app = createApp({
    components :{
        App
    }
})

app.use(i18nVue, {
    lang: store.getters.getLang ,
    resolve: lang => import(`../../lang/${lang}.json`),
})

app.use(store).use(router).mount("#app")



/* setTimeout(function () {
    axios.get("/api/user").then(res=>{

    }).catch(err=>{
         localStorage.clear()

        router.push({name: 'login'})

    })
}, 500)
*/
/* router.beforeEach((to, from, next) => {

    if (to.meta.middleware == "admin" || to.meta.middleware == "supervisor") {

        if (store.getters.isAdmin && store.getters.authenticated) {
            next()
        } else {
            localStorage.clear()

            next({name: "login"})
        }

        if (store.getters.isSupervisor && store.getters.authenticated) {
            next()
        } else {
            localStorage.clear()

            next({name: "login"})
        }


    } else {
        next()
    }
})
 */
