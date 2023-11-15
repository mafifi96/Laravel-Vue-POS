<template>
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page header -->
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Orders</h1>
        </div>

        <!-- Content Row -->
        <div class="row">

            <div class="col-md-12">

                <div class="card">
                    <div class="card-header">
                        <h6 class="h6 text-muted text-uppercase">all orders</h6>
                    </div>
                    <div class="card-body ">
                        <template v-if="loading">
<table-skeleton></table-skeleton>
                        </template>
                        <template>
                            
                        </template>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container-fluid -->

</template>

<script>
    import moment from 'moment'
    import TableSkeleton from '../../../inc/TableSkeleton.vue';

    export default {
        components : {
            TableSkeleton
        },
        data: function () {
            return {
                orders: [],
                loading: true
            };
        },
        methods: {
            async getOrders() {
                await axios.get("/api/orders").then(res => {
                    this.orders = res.data.orders;
                }).catch(err => {
                    console.log(err);
                }).finally(() => {
                    //this.loading = false;

                });
            },
            formateDate(date) {
                return moment(date).format("MMMM Do YYYY, h:mm:ss a");
            },
            currency(value) {
                let val = (value / 1).toFixed(2).replace(".", ",");
                return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            },
            warning(id) {
                Swal.fire({
                    title: "Warning!",
                    text: "Do you want to delete this order!",
                    icon: "warning",
                    confirmButtonText: "yes",
                    showCancelButton: true
                }).then(res => {
                    if (res.isConfirmed) {
                        this.deleteOrder(id);
                    }
                });
            },
            async deleteOrder(id) {
                await axios.delete(`/api/orders/${id}`).then(res => {
                    Swal.fire({
                        title: "deleted!",
                        text: "Order Deleted Successfully..!",
                        icon: "success",
                        showCancelButton: true
                    });
                    this.getOrders();
                }).catch(err => {
                    Swal.fire({
                        title: "error!",
                        text: "something went wrong..!",
                        icon: "error",
                        showCancelButton: true
                    });
                });
            }
        },
        mounted() {
            this.getOrders();
            document.title = "Store | Orders";
        },
        components: {
            TableSkeleton
        }
    }

</script>

<style>

</style>
