<template>
<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page header -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Profile</h1>

</div>

    <!-- Content Row -->
    <div class="row">
    <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="h4">Your Cart</h4>

                        <div v-show="errors && errors.msg" class="alert alert-danger">
                                                {{ errors.msg }}
                                            </div>


                        <div v-if="confirmed" class="alert alert-success alert-dismissible fade show" role="alert">
                            {{message}}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>


                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <td scope="col">#</td>
                                <td scope="col">Product</td>
                                <td scope="col">Quantity</td>
                                <td scope="col">Price</td>
                            </thead>

                            <tr v-for="(product , index) in products" :key="product.id">
                                <td>{{(index + 1)}}</td>
                                <td><router-link :to="{name : 'product'  ,params :{ id :product.id}}">{{product.product_name}}</router-link></td>
                                <td>{{product.quantity}}</td>
                                <td>{{product.price}}</td>

                            </tr>

                            <tr v-if="emptyCart">
                                <td colspan="4" class="text-center">Empty Cart</td>
                            </tr>

                            <tr v-else>
                                <td colspan="3" style>Total Price</td>
                                <td colspan="1">{{total_price}}</td>
                            </tr>

                        </table>
                    </div>

                    <div v-if="!emptyCart" class="card-footer justify-content-center">
                        <a @click.prevent="confirm()" class="btn btn-primary" id="confirm-order">

                        {{ processing ? 'Confirming..' : 'Confirm Order'}}</a>
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
                errors : {},
                products: [],
                emptyCart: false,
                confirmed  : false,
                message : '',
                total_price  : 0,
                processing : false
            }
        },

        methods: {
            getCartProducts() {
                axios.get("/api/customer/cart").then(res => {
                    if (!res.data.Products.length) {
                        this.emptyCart = true
                    }

                    console.log(res.data.Products)
                    console.log(res.data.totalPrice)

                    this.products = res.data.Products
                    this.total_price = res.data.totalPrice

                }).catch(err => {
                    console.log(err.response)
                })
            },
             confirm (){
                 this.processing = true
                 axios.post("api/order/confirm").then(res=>{
                     if(res.data.status){
                         this.confirmed = true
                         this.message = res.data.message
                         this.total_price = 0
                         this.products = []
                         this.emptyCart = true
                     }
                 }).catch(err=>{
                    console.log(err.response.data)
                 }).finally(() =>{

                     this.processing = false

                 })
            }

        },
        created() {
            this.getCartProducts()
        },
        mounted(){
            document.title = "Store | Profile"
        }

    }


</script>


<style scoped>

</style>
