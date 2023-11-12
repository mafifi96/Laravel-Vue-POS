<template>
<div>

        <!-- Begin Page Content -->
        <div class="container-fluid">
            <!-- Page header -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">customers</h1>
                <router-link :to="{name : 'supervisor.customers.create'}"
                    class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-plus fa-sm "></i>
                    Create customer</router-link>
            </div>

            <!-- Content Row -->
            <div class="row">

                <div class="col-md-12">

                    <div class="card">
                        <div class="card-header">
                            <h6 class="h6 text-muted">All customers</h6>
                        </div>
                        <div class="card-body table-responsive">
                            <table class="table table-bordered text-center">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">name</th>
                                        <th scope="col">phone</th>
                                        <th scope="col">email</th>
                                        <th scope="col">address</th>
                                        <th scope="col">Careated At</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr v-for="(customer , index) in customers" :key="index">
                                        <td scope="row">{{(index + 1)}}</td>
                                        <td>
                                            <router-link :to="{name : 'supervisor.customers' , params : {id : customer.id}}">
                                                {{customer.name}}</router-link>
                                        </td>
                                        <td>{{customer.phone ?? 'Not Provided'}}</td>
                                        <td>{{customer.email ?? 'Not Provided'}}</td>
                                        <td>{{customer.address ?? 'Not Provided'}}</td>
                                        <td>{{formateDate(customer.created_at)}}</td>

                                        <td>
                                            <div class="btn-group">
                                            <router-link
                                                    :to="{name : 'supervisor.customers.orders.create', params : {cid : customer.id }}"
                                                    class="btn btn-info">
                                                    <i class="fas fa-plus"></i>
                                                </router-link>
                                                <router-link
                                                    :to="{name : 'supervisor.customers.edit', params : {cid : customer.id}}"
                                                    class="btn btn-primary">
                                                    <i class="fas fa-edit"></i>
                                                </router-link>
                                                <a @click.prevent="warning($event)" :data-id="customer.id"
                                                    class="btn btn-danger "><i class="fas fa-trash"></i>
                                                </a>

                                            </div>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- /.container-fluid -->
    </div>


</template>

<script>
import moment from 'moment'

export default {
    data : () => ({
        customers : {},
        _id : null
    }),
    methods: {
            getcustomers() {
                axios.get("/api/sv/customers").then(res => {

                    this.customers = res.data.customers;

                }).catch(err => {
                    console.log(err)
                })
            },
            warning(id) {
                this._id = id
                Swal.fire({
                    title: 'Warning!',
                    text: 'Do you want to delete this customer!',
                    icon: 'warning',
                    confirmButtonText: 'yes',
                    showCancelButton: true
                }).then(res => {
                    if (res.isConfirmed) {
                        this.deletecustomer(id)
                    }
                })
            },
            async deletecustomer(id) {

                await axios.delete(`/api/sv/customers/${this._id}`).then(res => {

                    Swal.fire({
                        title: 'deleted!',
                        text: 'customer Deleted Successfully..!',
                        icon: 'success',
                        showCancelButton: true
                    })
                    this.getcustomers()
                }).catch(err => {

                    Swal.fire({
                        title: 'error!',
                        text: 'something went wrong..!',
                        icon: 'error',
                        showCancelButton: true
                    })

                })

            },
            formateDate(date) {
                return moment(date).format('MMMM Do YYYY, h:mm:ss a');
            }
        },
        mounted() {
            this.getcustomers()
            document.title = "Store | customers"

        }
}
</script>

<style>

</style>
