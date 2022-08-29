<template>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Orders</h1>
        </div>

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="h4">Your Orders</h4>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <td scope="col">#</td>
                                <td scope="col">Product</td>
                                <td scope="col">Quantity</td>
                                <td scope="col">Price</td>

                            </thead>
                            <template v-for="order in orders">
                                <tr v-for="(product , index) in order.products" :key="product.id">

                                    <td>{{(index + 1)}}</td>
                                    <td>
                                        <router-link :to="{name : 'product'  ,params :{ id :product.id}}">
                                            {{product.title}}</router-link>
                                    </td>
                                    <td>{{product.pivot.quantity}}</td>
                                    <td>{{product.price}}</td>

                                </tr>
                                <tr>
                                    <td colspan="3">Status</td>
                                    <td colspan="1">{{order.status}}</td>
                                </tr>
                            </template>
                            <tr v-if="emptyOrders">
                                <td colspan="4" class="text-center">No Orders</td>
                            </tr>

                            <tr v-else>
                                <td colspan="3" style>Total Price</td>
                                <td colspan="1">{{total_price}}</td>
                            </tr>

                        </table>
                    </div>

                </div>

            </div>

        </div>

    </div>
    <!-- /.container-fluid -->


</template>

<script>
    export default {

        data: function () {
            return {
                errors: {},
                orders: [],
                emptyOrders: false,
                total_price: 0,
            }
        },

        methods: {
            getOrders() {
                axios.get("/api/customer/orders").then(res => {
                    if (!res.data.orders.length) {
                        this.emptyOrders = true
                    }

                    this.orders = res.data.orders
                    this.total_price = res.data.total_price

                }).catch(err => {
                    console.log(err)
                })
            }
        },
        created() {
            this.getOrders()
        },
        mounted (){
            document.title = "Store | Orders"
        }

    }

</script>


<style scoped>

</style>
