<template>
    <div class="container-fluid">
        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Categories</h1>

            <router-link :to="{name : 'admin.category.create'}"
                class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-plus fa-sm "></i>
                Create Category</router-link>

        </div>

        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        <h6 class="h6 text-muted">All Categories</h6>
                    </div>
                    <div class="card-body table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Careated At</th>
                                    <th scope="col">Last Update</th>
                                </tr>
                            </thead>
                            <tbody>


                                <tr v-for="(category, index) in categories" :key="category.id">
                                    <th scope="row">{{ (index + 1)}}</th>
                                    <td>
                                        <router-link :to="{name : 'admin.category' , params : {id : category.id}}"
                                            class="btn text-decoration-none">{{category.name}}</router-link>
                                    </td>
                                    <td>{{formateDate(category.created_at)}}</td>
                                    <td>{{formateDate(category.updated_at)}}</td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>

    </div>

</template>
<script>
import moment from 'moment'

    export default {
        data: function () {

            return {
                categories: []
            }
        },
        methods: {
            getCategories() {
                axios.get("/api/categories").then(res => {
                    this.categories = res.data;
                }).catch(err => {
                    console.log(err)
                })
            },
            formateDate(value){
                return moment(value).format('MMMM Do YYYY, h:mm:ss a');
            }
        },
        mounted() {
            this.getCategories()
            document.title = "Store | Categories"
        }
    }

</script>

<style scoped>

</style>
