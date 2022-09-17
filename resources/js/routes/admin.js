import Dashboard  from '../Components/Admin/pages/Dashboard.vue'
import Categories from '../Components/Admin/pages/category/categories.vue'
import Category from '../Components/Admin/pages/category/category.vue'
import CategoryCreate from '../Components/Admin/pages/category/create.vue'
import CategoryEdit from '../Components/Admin/pages/category/edit.vue'
import Products from '../Components/Admin/pages/product/products.vue'
import Product from '../Components/Admin/pages/product/product.vue'
import ProductEdit from '../Components/Admin/pages/product/edit.vue'
import ProductCreate from '../Components/Admin/pages/product/create.vue'
import Orders from '../Components/Admin/pages/order/orders.vue'
import Order from '../Components/Admin/pages/order/order.vue'
import OrderCreate from '../Components/Admin/pages/order/create.vue'
import OrderEdit from '../Components/Admin/pages/order/edit.vue'
import Customers from '../Components/Admin/pages/customer/customers.vue'
import Customer from '../Components/Admin/pages/customer/customer.vue'
import CustomersCreate from '../Components/Admin/pages/customer/create.vue'
import CustomersEdit from '../Components/Admin/pages/customer/edit.vue'
import Supervisors from '../Components/Admin/pages/supervisor/supervisors.vue'
import Supervisor from '../Components/Admin/pages/supervisor/supervisor.vue'
import SupervisorsCreate from '../Components/Admin/pages/supervisor/create.vue'
import SupervisorsEdit from '../Components/Admin/pages/supervisor/edit.vue'



const routes = [
    {
        path: '/dashboard',
        name: 'dashboard',
        component: Dashboard,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/categories',
        name: 'admin.categories',
        component: Categories,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/category/:id(\\d+)',
        name: 'admin.category',
        component: Category,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/category/create',
        name: 'admin.category.create',
        component: CategoryCreate,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/category/:id(\\d+)/edit',
        name: 'admin.category.edit',
        component: CategoryEdit,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/products',
        name: 'admin.products',
        component: Products,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/products/:id(\\d+)',
        name: 'admin.products.product',
        component: Product,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/products/create',
        name: 'admin.products.create',
        component: ProductCreate,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/products/:id(\\d+)/edit',
        name: 'admin.products.edit',
        component: ProductEdit,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/orders',
        name: 'admin.orders',
        component: Orders,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/orders/:id(\\d+)',
        name: 'order',
        component: Order,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/customers/:cid(\\d+)/orders/:oid(\\d+)/edit',
        name: 'admin.customers.orders.edit',
        component: OrderEdit,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/customers/:cid(\\d+)/orders/create',
        name: 'admin.customers.orders.create',
        component: OrderCreate,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/customers',
        name: 'admin.customers',
        component: Customers,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/customers/create',
        name: 'admin.customers.create',
        component: CustomersCreate,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/customers/:cid(\\d+)/edit',
        name: 'admin.customers.edit',
        component: CustomersEdit,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/customers/:id(\\d+)',
        name: 'admin.customers.customer',
        component: Customer,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/supervisors',
        name: 'admin.supervisors',
        component: Supervisors,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/supervisors/:id(\\d+)',
        name: 'admin.supervisors.supervisor',
        component: Supervisor,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/supervisors/:id(\\d+)/edit',
        name: 'admin.supervisors.edit',
        component: SupervisorsEdit,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    },
    {
        path: '/admin/supervisors/create',
        name: 'admin.supervisors.create',
        component: SupervisorsCreate,
        meta : {
            middleware : "admin",
            layout : "AdminLayout"
        }
    }

];

export default routes
