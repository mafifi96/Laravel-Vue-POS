import Profile from '../Components/Customer/profile.vue'
import Orders from '../Components/Customer/orders.vue'

const routes = [
    {
        path : '/customer',
        name : 'customer',
        component : Profile,
        meta : {
            middleware : "customer",
            layout : 'CustomerLayout'
        }
    },
    {
        path : '/customer/orders',
        name : 'customer.orders',
        component : Orders,
        meta : {
            middleware : "customer",
            layout  : 'CustomerLayout'
        }
    }
]

export default routes
