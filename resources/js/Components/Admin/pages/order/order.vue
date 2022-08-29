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
                        <h6 class="h4">Order Number <strong>{{order.id}}</strong> - Customer
                            <strong>{{order.user.name}}</strong></h6>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <td scope="col">#</td>
                                <td scope="col">Product</td>
                                <td scope="col">Quantity</td>
                                <td scope="col">Price</td>
                                <td scope="col">ordered at</td>
                            </thead>
                            <tr v-for="(product , index) in order.products" :key="product.id">
                                <td>{{(index + 1)}}</td>
                                <td>
                                    <router-link :to="{name : 'product'  ,params :{ id :product.id}}">
                                        {{product.title}}</router-link>
                                </td>
                                <td>{{product.pivot.quantity}}</td>
                                <td>&dollar;{{currency(product.price)}}</td>
                                <td>{{formateDate(order.created_at) }}</td>
                            </tr>
                            <tr>
                                <td colspan="3">Total Price</td>
                                <td colspan="1">&dollar;{{currency(order.total_price)}}</td>
                            </tr>
                            <tr>
                                <td colspan="4">Status</td>
                                <td colspan="1">
                                    <select  v-model="status" class="form-select form-select-md ">
                                        <option value="shipping" :selected="order.status == 'shipping'" >
                                            Shipping</option>
                                        <option value="canceled" :selected="order.status == 'canceled'" >
                                            Canceled</option>
                                        <option value="shipped" :selected="order.status == 'shipped'" >Shipped</option>

                                    </select>

                                </td>
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
import moment from 'moment'

    export default {
        data: function () {
            return {
                order: null,
                ID: this.$route.params.id,
                status : ''
            }
        },
        methods: {
            async getOrder() {
                await axios.get("/api/admin/orders/" + this.ID).then(res => {
                    this.order = res.data.order
                    this.status = this.order.status
                }).catch(err => {
                    console.log(err)
                })
            },
           async updateStatus(){

               let formData = new FormData()

               formData.append('status',this.status)
               formData.append('_method','PUT')


                await axios.post("/api/admin/orders/"+this.ID+"/status",formData).then(res=>{

                    Swal.fire({
                            title: 'Updated!',
                            text: 'Order Updated Successfully..!',
                            icon: 'success',
                            showCancelButton: true
                        })

                }).catch(err=>{
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
        watch : {
            status : function(n , o){
                if(o){
                    this.updateStatus()
                }
            }
        },
        mounted() {
            this.getOrder()
            document.title = "Store | Order - " + this.ID

        }

    }

</script>

<style>

</style>
