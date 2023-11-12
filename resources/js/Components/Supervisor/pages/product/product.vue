<template>
<div>
    <div class="dialog">
        <div class="card">
            <div class="card-header">
                <h4>Are You Sure You Want To Delete This Item ?</h4>
            </div>
            <div class="card-body" style="padding:10px;text-align:center;">
                <div class="btn-group">
                    <a class="btn btn-danger mx-4" id="delete">Delete</a>
                    <a class="btn btn-primary" id="cancel">Cancel</a>
                </div>
            </div>
            <div class="card-footer"></div>
        </div>
    </div>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-end mb-4">

            <router-link :to="{name :'supervisor.products.create'}" class="btn btn-sm btn-primary shadow-sm mx-2"><i
                    class="fas fa-plus fa-sm "></i>
                Create product</router-link>
            <router-link :to="{name : 'supervisor.products.edit' , params : {id : product.id}}"
                class="btn btn-info btn-sm shadow-sm"><i class="fas fa-edit fa-sm"></i> Edit</router-link>
        </div>

        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">
                <h3 class="h3">{{product.title}}</h3>

                <div class="product-cover" style="height: 400px; width:100%;overflow:hidden">
                    <img class="img-thumbnail" style="display: block; width:100%;height:100%"
                        :src="'/storage/'+ product.images[0].image" :alt="product.title"
                        :title="product.title">
                </div>
                <div v-html="product.description" class="body mt-3">


                </div>
                <div>
                <p class="mt-3"> Category : <router-link class="text-decoration-none"
                            :to="{name : 'supervisor.category' , params : {id : product.category.id}}"><strong>{{product.category.name}}</strong></router-link>
                    </p>
                </div>
            </div>


        </div>

    </div>
    <!-- /.container-fluid -->
</div>
</template>

<script>
    export default {

        data: function(){
            return {
                product: {},
                id : this.$route.params.id
            }
        },
            methods: {
              async getProduct(){
                   await axios.get("/api/sv/products/" + this.id).then(res => {

                    this.product = res.data.product

                    document.title = "Store | " + this.product.title

                }).catch(err => {
                    console.log(err)
                })
                }
            },
            mounted(){
                this.getProduct()

            }

    }

</script>
