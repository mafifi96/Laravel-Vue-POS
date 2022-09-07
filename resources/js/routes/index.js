import {createRouter, createWebHistory} from 'vue-router'
import adminRoutes from './admin'
import publicRoutes from './public'
import customeRoutes from './customer'

const routes = [...adminRoutes,...publicRoutes,...customeRoutes]

const router = createRouter({
    history : createWebHistory(),
    routes
})


/* function checkAuth()
{
    axios.get("/api/user").then(res=>{
        return true
    }).catch(e=>{
        return false
    })
} */
/* router.beforeEach((to,from)=>{
    if (to.meta.middleware == "admin") {
        let auth = checkAuth()
        if(!auth)
        {
            localStorage.clear()
            router.push({
                    name: "login"
                })

        }
    }
})
 */

export default router
