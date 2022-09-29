<template>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Categories</h1>

        </div>

        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        <h6 class="h6 text-muted">Create New Category</h6>

                        <div v-show="errors && errors.msg" class="alert alert-danger">
                            {{ errors.msg }}
                        </div>

                            <div v-show="saved"  class="alert alert-success alert-dismissible fade show" role="alert">
                                <p v-html="message"></p>
                                <button @click="!saved" type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>


                    </div>
                    <div class="card-body">
                        <form >

                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" v-model="name" name="name"
                                    placeholder="Enter Category Name..." required>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control form-control-user" v-model="desc" name="description"
                                    placeholder="Description"></textarea>
                            </div>
                            <button :disabled="processing" @click.prevent="createCategory()"
                                class="btn btn-primary btn-user btn-block">
                                {{ processing ? "Saving..." : "Create" }}
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
    export default {
        data: function () {
            return {
                errors: {},
                saved : false,
                message : '',
                name : '',
                desc : '',
                processing : false
            }
        },
        methods: {
            createCategory()
            {
                axios.post("/api/categories" , {
                    name : this.name,
                    description : this.desc
                }).then(res=>{
                    this.saved = true
                    this.message = res.data.message
                    this.name = ''
                    this.desc = ''
                }).catch(err=>{
                    this.errors = err.response.data
                })
            }
        },
        mounted(){
            document.title = "Store | Create Category"
        }

    }

</script>

<style>

</style>
