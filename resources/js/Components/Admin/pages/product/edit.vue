<template>
    <div>
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page header -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Products</h1>
            </div>

            <!-- Content Row -->
            <div class="row">

                <div class="col-md-12">

                    <div class="card">
                        <div class="card-header">
                            <h6 class="h6 text-muted">Edit Product</h6>
                            <Errors :errors="errors"></Errors>
                        </div>

                        <div v-if="saved" class="alert alert-success alert-dismissible fade show m-3" role="alert">
                            {{message}}
                            <button @click="!saved" type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>

                    </div>
                    <div class="card-body">
                        <form enctype="multipart/form-data">

                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" v-model="product.title"
                                    placeholder="title" required>
                            </div>
                            <div>
                                <img class="img-thumbnail" style="display: block; width:100%;height:70%"
                                    :src="'/storage/'+ product.image" :alt="product.title"
                                    :title="product.title" id="cover">
                            </div>
                            <div class="form-group">
                                <input type="file" name="image" id="file" class="form-control form-control-user"
                                    v-on:change="product.image = $event.target.files[0]" placeholder="image" required>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control form-control-user" v-model="product.description" required
                                    placeholder="Description..."></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control form-control-user" v-model="product.price"
                                    placeholder="price" required>
                            </div>
                            <div class="form-group">
                                <input class="form-control form-control-user" v-model="product.quantity" type="number"
                                    required placeholder="quantity">
                            </div>

                            <div class="form-group">
                                <select v-model="product.category_id" class="form-control form-control-user">
                                    <option value="" selected>--Category--</option>

                                    <option v-for="category in categories" :key="category.id" :value="category.id">
                                        {{category.name}}</option>
                                </select>
                            </div>
                            <button :disabled="processing" @click.prevent="updateProduct()"
                                class="btn btn-primary btn-user btn-block">
                                {{ processing ? "Saving..." : "Save" }}
                                <img v-show="processing" src="/imgs/ajax.gif" alt="loading">
                            </button>
                        </form>
                    </div>
                </div>
            </div>

        </div>

    </div>
    <!-- /.container-fluid -->


</template>

<script>
import Errors from '../../../inc/ValidationErrors.vue'

    export default {
        components : {
            Errors
        },
        data: function () {
            return {
                product: {
                    title: null,
                    description: null,
                    image: null,
                    price: null,
                    quantity: null,
                    images :null,
                    category_id: null,
                    categories: null,

                },
                saved: false,
                message: null,
                processing: false,
                categories: [],
                brands: [],
                errors: null,
                csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                ID: this.$route.params.id
            }
        },
        methods: {

            async getCategoriesAndBrands() {
               await axios.get("/api/products/create").then(res => {

                    this.categories = res.data.categories;
                    this.brands = res.data.brands;

                }).catch(err => {
                    console.log(err)
                })

            },
            async updateProduct() {
                this.processing = true

                delete this.product['category']
                delete this.product['brand']
                delete this.product['images']
                delete this.product['created_at']
                delete this.product['updated_at']

                let formData = new FormData();

                for (let [key , value] of Object.entries(this.product)){

                    formData.append(key,value)

                }

                formData.append('_method', 'PATCH')
                formData.append('_token', this.csrf)
                console.table(formData)
                await axios.post(`/api/products/${this.ID}`, formData, {
                    headers : {
                        'content-type' : 'multipart/form-data'
                    }
                })
                    .then(res => {

                        this.saved = true
                        this.message = res.data.message

                        Swal.fire({
                            title: 'updated!',
                            text: 'Product Updated Successfully..!',
                            icon: 'success',
                            showCancelButton: true
                        })
                        this.getProduct()

                    }).catch(err => {

                        this.errors = err.response.data.errors


                    }).finally(() => {
                        this.processing = false
                    })

            },
            async getProduct() {
               await axios.get("/api/products/" + this.ID).then(res => {

                    this.product = res.data.product

                    document.title = "Store | Edit - " + this.product.title

                    this.product.image = res.data.product.images[0].image


                }).catch(err => {
                    console.log(err)
                })

            }
        },
        mounted() {
            this.getCategoriesAndBrands()
            this.getProduct()
            document.title = "Store | Product - Edit"

            $("#file").change(function () {

                    $("#cover-thumbnail").removeClass("d-none");
                    const file = this.files[0];
                    if (file) {
                        let reader = new FileReader();
                        reader.onload = function (event) {
                            $("#cover")
                                .attr("src", event.target.result);
                        };
                        reader.readAsDataURL(file);
                    }
                });


        }

    }

</script>

<style>

</style>
