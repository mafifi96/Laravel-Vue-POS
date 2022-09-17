import {
    createRouter,
    createWebHistory
} from 'vue-router'
import adminRoutes from './admin'
import publicRoutes from './public'
import customeRoutes from './customer'

const routes = [...adminRoutes, ...publicRoutes, ...customeRoutes]

const router = createRouter({
    history: createWebHistory(),
    routes
})



router.beforeEach((to, from, next) => {
    // to and from are both route objects. must call `next`.
    if (to.meta.middleware == "admin") {

        axios.get("/api/user").then(res=>{
            next()
        }).catch(err=>{

            localStorage.clear()
            next({
                name: "login"
            })
        })

    }else{
        next()
    }
})


export default router
