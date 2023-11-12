import {
    createRouter,
    createWebHistory
} from 'vue-router'
import adminRoutes from './admin'
import publicRoutes from './public'
import supervisorRoutes from './supervisor'

const routes = [...adminRoutes, ...publicRoutes, ...supervisorRoutes]

const router = createRouter({
    history: createWebHistory(),
    routes
})


router.beforeEach((to, from, next) => {

    if (to.meta.middleware == "admin" && !store.getters.isAdmin ) {

        localStorage.clear()

        next({name: "login"})
    }

    if (to.meta.middleware == "supervisor" && !store.getters.isSupervisor) {

        localStorage.clear()

        next({name: "login"})
    }

next()
})

export default router
