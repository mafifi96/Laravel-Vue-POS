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

export default router
