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
                        <h6 class="h6 text-muted">Edit Category {{Category.name}}</h6>

                        <div v-show="errors && errors.msg" class="alert alert-danger">
                            {{ errors.msg }}
                        </div>

                        <div v-show="saved" class="alert alert-success alert-dismissible fade show" role="alert">
                            <p v-html="message"></p>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>

                    </div>
                    <div class="card-body">
                        <form @submit.prevent="updateCategory()">

                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" v-model="name"
                                    placeholder="Enter Category Name..." required>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control form-control-user" v-model="desc"
                                    placeholder="Description"></textarea>
                            </div>
                            <div class="text-center">
                                <button :disabled="processing" type="submit" class=" btn btn-primary btn-user">
                                    {{processing ? "Updating..." : "Save"}}
                                </button>
                            </div>
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
                saved: false,
                processing: false,
                message: '',
                name: '',
                desc: '',
                id: this.$route.params.id,
                Category: {}
            }
        },
        methods: {
            updateCategory() {
                this.processing = true
                axios.put("/api/categories/" + this.id, {
                    name: this.name,
                    description: this.desc
                }).then(res => {
                    this.saved = true
                    this.message = res.data.message
                    this.name = ''
                    this.desc = ''
                }).catch(err => {
                    this.errors = err.response.data
                }).finally(() => {
                    this.processing = false
                })
            },
            getCategory() {

                axios.get("/api/categories/" + this.id).then(res => {

                    this.Category = res.data;

                }).catch(err => {
                    console.log(err)
                })
            }
        },
        watch: {
            $route(to, from) {
                this.id = this.$route.params.id
                this.getCategory()
                document.title = "Store | Category - " + this.name
            }
        },
        mounted() {
            this.getCategory()
        }

    }

</script>

<style>

</style>
