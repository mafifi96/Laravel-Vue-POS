<template>
    <div class="col-md-10 col-lg-10 col-sm-12 ">
        <div class="container">
            <div class="row">
            <Spinner v-show="loading"></Spinner>

                <!-- Products -->
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-lg-6 mb-3 " v-for=" product in products.products" :key="product.id">

                            <div class="product mb-2 shadow-sm j">
                                <div class="pro-header mb-1">
                                     <router-link :to="{ name :'product', params : {id : product.id } }">
                                        <img :src="'/storage/'+ product.images[0].image" style="height:40vh;"
                                            class="img-fluid card-img-top" alt="placeholder">

                                    </router-link>


                                </div>

                                <div class="pro-body mb-1 p-2">
                                    <h5 :title=" product.title ">
                                        <router-link :to="{ name :'product', params : {id : product.id } }"
                                            style="color:#555;font-weight:400"
                                            class="text-decoration-none text-left text-capitalize">
                                            {{ product.title }}
                                        </router-link>
                                    </h5>
                                    <p style="font-weight:800;color:#000;">&dollar;{{ product.price }}</p>

                                    <div class="pro-add p-2">

                                        <form method="post" name="add">
                                            <div class="row">
                                                <div class="col-md-8 justify-content-">
                                                    <div class="form-group">
                                                        <input type="number" class="form-control" name="quantity"
                                                            value=""
                                                            :placeholder="'in stock ' + product.quantity "
                                                            :max= product.quantity>
                                                    </div>
                                                </div>

                                                <div class="col-md-2 pull-right">
                                                    <button  @click.prevent="addToCart($event)" :data-title= product.title
                                                        :data-price= product.price :data-id= product.id
                                                        class="btn btn-primary addtocart" name="submit">Add</button>
                                                </div>
                                            </div>
                                        </form>

                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


    </div>


</template>

<script>

import Spinner from '../inc/Spinner'

    export default {

        data() {
            return {
                products: [],
                Id : this.$route.params.id,
                title : this.$route.params.name,
                loading : true

            }
        },
        components : {
            Spinner
        },
        methods: {
            getProducts() {
                axios.get("/api/brand/" + this.Id ).then(res => {
                    this.products = res.data;
                    this.loading = false
                    document.title = "Store | "+ this.title

                }).catch(err => {
                    console.log(err)
                })
            },
            addToCart(e) {

                let Id = e.target.dataset.id;

                let fm = e.target.closest("form")[0];

                let Quantity = fm.value;

                if ((Quantity == '' && !isNaN(Quantity)) || (Quantity >= 1 && !isNaN(Quantity))) {

                    Quantity = (Quantity == '') ? 1 : Quantity;

                   axios.post("http://127.0.0.1:8000/api/cart/add", {
                        product_id: Id,
                        quantity: Quantity,
                    }).then(res => {

                        this.$store.dispatch('Quantity')

                        console.log("product added : " + res.data.message)

                    }).catch(err => {

                            console.log(err.data.message)

                    })

                } else if (Quantity <= 0 || isNaN(Quantity)) {
                    console.log(Quantity)
                    alert("Invalid Quantity");
                    fm.quantity.value = "";
                    return;
                }

            }
        },
        mounted() {
            this.getProducts();
        },
    }

</script>


<style scoped>

</style>
