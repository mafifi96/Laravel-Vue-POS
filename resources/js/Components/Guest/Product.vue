<template>
    <div class="col-md-9 col-lg-9 col-sm-12">
        <div class="container">
            <div class="row ">
                <Spinner v-show="loading"></Spinner>
                <!-- Product -->
                <div class="col-md-12 col-sm-12 col-lg-12  ">

                    <div class="product jusitfy-content-center">
                        <div class="pro-header mb-1">
                            <div class="pro-img" style="width: 100%;height:80vh;overflow:hidden;">
                                <img :src="'/storage/'+ product.images[0].image" class="img-fluid "
                                    style="width:100%;display:block;" :alt=product.title :title=product.title>
                            </div>
                        </div>
                        <div class="pro-body mb-1 p-2">
                            <h2 class="text-capitalize" :title=product.title>
                                {{ product.title }}
                            </h2>

                            <p style="font-weight:800;color:#000;">&dollar;{{ product.price }}</p>
                            <p style="font-weight:400;color:#000;">Brand -
                                <router-link
                                    :to="{name : 'brand', params : {id : product.brand.id , name : product.brand.name}}">
                                    {{ product.brand.name }}</router-link>
                            </p>


                            <div class="pro-desc p-2" v-html="product.description">
                            </div>

                            <div class="pro-add">
                                <form method="post" name="add">
                                    <div class="row">
                                        <div class="col-md-8 justify-content-">
                                            <div class="form-group">
                                                <input type="number" class="form-control" name="quantity" value=""
                                                    :placeholder="'in stock ' + product.quantity "
                                                    :max=product.quantity>
                                            </div>
                                        </div>

                                        <div class="col-md-2 pull-right">
                                            <button @click.prevent="addToCart($event)" :data-title=product.title
                                                :data-price=product.price :data-id=product.id
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



</template>

<script>

    import Spinner from '../inc/Spinner'

    export default {

        data: function () {
            return {
                product: {},
                id: this.$route.params.id,
                loading: true
            }
        },
        components: {
            Spinner
        },
        methods: {
            getProduct() {
                axios.get("/api/products/" + this.id).then(res => {
                    this.product = res.data.product
                    this.loading = false
                    document.title = "Store | " + this.product.title

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

                    axios.post("/api/cart/add", {
                        product_id: Id,
                        quantity: Quantity,
                    }).then(res => {

                        this.$store.dispatch('Quantity')

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
            this.getProduct()

        }

    }

</script>
<style scoped>

</style>>
