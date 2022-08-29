import {createRouter, createWebHistory} from 'vue-router'
import adminRoutes from './admin'
import publicRoutes from './public'
import customeRoutes from './customer'

const routes = [...adminRoutes,...publicRoutes,...customeRoutes]

const router = createRouter({
    history : createWebHistory(),
    routes
})


export default router
