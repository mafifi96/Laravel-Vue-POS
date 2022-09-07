<template>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Orders</h1>
        </div>

        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        <h6 class="h6 text-muted text-uppercase">all orders</h6>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Customer</th>
                                    <th scope="col">Careated At</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="(order,index) in orders" :key="index">
                                    <td scope="row">
                                        <router-link :to="{name :'admin.orders.order', params :{id : order.id}}">
                                            {{order.id}}
                                        </router-link>
                                    </td>
                                    <td>{{order.status}}</td>
                                    <td>&dollar;{{currency(order.total_price) }}</td>
                                    <td>{{order.user.name}}</td>
                                    <td>{{formateDate(order.created_at)}}</td>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->

</template>

<script>
import moment from 'moment'

    export default {

        data: function () {
            return {
                orders: []
            }
        },
        methods: {
            async getOrders() {
                await axios.get("/api/orders").then(res => {

                    this.orders = res.data.orders

                }).catch(err => {
                    console.log(err)
                })
            },
            formateDate(date) {
                return moment(date).format('MMMM Do YYYY, h:mm:ss a');
            },
            currency(value) {
                let val = (value / 1).toFixed(2).replace('.', ',')
                return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
            }
        },
        mounted() {
            this.getOrders()
            document.title = "Store | Orders"

        }

    }

</script>

<style>

</style>
