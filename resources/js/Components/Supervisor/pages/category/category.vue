<template>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Category</h1>

            <div class="btn-group">
                <router-link :to="{name : 'supervisor.category.create'}"
                    class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-plus fa-sm "></i>
                    Create Category</router-link>

                <router-link :to="{name : 'supervisor.category.edit' , params : {id : Id }}"
                    class="d-none d-sm-inline-block ms-2 btn btn-sm btn-primary shadow-sm"><i
                        class="fas fa-edit fa-sm "></i> Edit Category</router-link>
            </div>
        </div>

        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        <h6 class="h6 text-muted">{{ category.name }}</h6>

                    </div>
                    <div class="card-body">
                        <p>{{ category.description }}</p>
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
                category: {},
                Id: this.$route.params.id
            }
        },
        methods: {
            getCategory() {
                axios.get("/api/sv/categories/" + this.Id).then(res => {

                    this.category = res.data;
                    document.title = "Store | "+ this.category.name

                }).catch(err => {
                    alert(err)
                })
            }
        },
        watch: {
             'Id':function()
             {
                 this.getCategory()
             }
        },
        mounted() {
            this.getCategory()
        }
    }

</script>
