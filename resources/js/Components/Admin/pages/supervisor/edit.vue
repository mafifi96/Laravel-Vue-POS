<template>
    <div>
        <!-- Begin Page Content -->
        <div class="container-fluid">

            <!-- Page header -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">supervisors</h1>
            </div>

            <!-- Content Row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="h6 text-muted">Update supervisor</h6>
                            <Errors :errors="errors"></Errors>
                        </div>

                        <div v-if="saved" class="alert alert-success alert-dismissible fade show m-2" role="alert">
                            {{message}}
                            <button @click="!saved" type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>

                    </div>
                    <div class="card-body">
                        <form>

                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" v-model="supervisor.name"
                                    placeholder="name" required>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control form-control-user" v-model="supervisor.email"
                                    placeholder="email">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-control-user" v-model="supervisor.password"
                                    placeholder="password">
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control form-control-user" v-model="supervisor.phone"
                                    placeholder="phone" required>
                            </div>

                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" v-model="supervisor.address"
                                    placeholder="address" required>
                            </div>
                            <div>
                            <span class="mb-2 d-block text-capitalize">permisions</span>
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="product-tab" data-bs-toggle="tab"
                                            data-bs-target="#product" type="button" role="tab" aria-controls="product"
                                            aria-selected="true">product</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="category-tab" data-bs-toggle="tab"
                                            data-bs-target="#category" type="button" role="tab" aria-controls="category"
                                            aria-selected="false">Category</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="customer-tab" data-bs-toggle="tab"
                                            data-bs-target="#customer" type="button" role="tab" aria-controls="customer"
                                            aria-selected="false">Customer</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="order-tab" data-bs-toggle="tab"
                                            data-bs-target="#order" type="button" role="tab" aria-controls="order"
                                            aria-selected="false">Order</button>
                                    </li>
                                </ul>
                                <div class="tab-content" id="myTabContent">

                                    <div class="tab-pane fade show active" id="product" role="tabpanel"
                                        aria-labelledby="product-tab">
                                        <div class="form-check m-1">
                                            <input class="form-check-input"  type="checkbox"
                                                id="create-product" v-model="abilities" :value="1">
                                            <label class="form-check-label" for="create-product">
                                                create
                                            </label>
                                        </div>

                                        <div class="form-check m-1">
                                            <input class="form-check-input"  type="checkbox"
                                                id="update-product" v-model="abilities" :value="2">
                                            <label class="form-check-label" for="update-product">
                                                update
                                            </label>
                                        </div>
                                        <div class="form-check m-1">
                                            <input class="form-check-input"  type="checkbox"
                                                id="delete-product" v-model="abilities" :value="3">
                                            <label class="form-check-label" for="delete-product">
                                                delete
                                            </label>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="category" role="tabpanel"
                                        aria-labelledby="category-tab">
                                        <div class="form-check m-1">
                                            <input class="form-check-input"  type="checkbox"
                                                id="create-category" v-model="abilities" :value="4">
                                            <label class="form-check-label" for="create-category">
                                                create
                                            </label>
                                        </div>

                                        <div class="form-check m-1">
                                            <input class="form-check-input"  type="checkbox"
                                                id="update-category" v-model="abilities" :value="5">
                                            <label class="form-check-label" for="update-category">
                                                update
                                            </label>
                                        </div>
                                        <div class="form-check m-1">
                                            <input class="form-check-input"  type="checkbox"
                                                id="delete-category" v-model="abilities" :value="6">
                                            <label class="form-check-label" for="delete-category">
                                                delete
                                            </label>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="customer" role="tabpanel" aria-labelledby="customer-tab">
                                        <div class="form-check m-1">
                                            <input class="form-check-input"  type="checkbox"
                                                id="create-customer"  v-model="abilities" :value="7">
                                            <label class="form-check-label" for="create-customer">
                                                create
                                            </label>
                                        </div>

                                        <div class="form-check m-1">
                                            <input class="form-check-input"  type="checkbox"
                                                id="update-customer" v-model="abilities" :value="8">
                                            <label class="form-check-label" for="update-customer">
                                                update
                                            </label>
                                        </div>
                                        <div class="form-check m-1">
                                            <input class="form-check-input"  type="checkbox"
                                                id="delete-customer" v-model="abilities" :value="9" >
                                            <label class="form-check-label" for="delete-customer">
                                                delete
                                            </label>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade" id="order" role="tabpanel" aria-labelledby="order-tab">
                                        <div class="form-check m-1">
                                            <input class="form-check-input"  type="checkbox"
                                                id="create-order"  v-model="abilities" :value="10">
                                            <label class="form-check-label" for="create-order">
                                                create
                                            </label>
                                        </div>

                                        <div class="form-check m-1">
                                            <input class="form-check-input"  type="checkbox"
                                                id="update-order" v-model="abilities" :value="11">
                                            <label class="form-check-label" for="update-order">
                                                update
                                            </label>
                                        </div>
                                        <div class="form-check m-1">
                                            <input class="form-check-input"  type="checkbox"
                                                id="delete-order" v-model="abilities" :value="12" >
                                            <label class="form-check-label" for="delete-order">
                                                delete
                                            </label>
                                        </div>
                                    </div>

                                </div>


                            </div>

                            <button :disabled="processing" @click.prevent="updatesupervisor()"
                                class="btn btn-primary btn-user btn-block">
                                {{ processing ? "Saving..." : "Update" }}
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
        components: {
            Errors
        },
        data: function () {
            return {
                supervisor: {
                    name: null,
                    email: null,
                    phone: null,
                    address: null,
                    password : null,
                    abilities : [],
                    _method: "UPDATE"
                },
                abilities : [],
                _id: this.$route.params.id,
                saved: false,
                message: null,
                processing: false,
                errors: null,
                csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            }
        },
        methods: {

            async updatesupervisor() {

                this.processing = true

                this.supervisor.abilities = this.abilities

                await axios.patch(`/api/supervisors/${this._id}`,this.supervisor)
                    .then(res => {

                        this.saved = true
                        this.message = res.data.message

                    }).catch(err => {

                        this.errors = err.response.data.errors

                    }).finally(() => {
                        this.processing = false
                    })
            },
            async getsupervisor() {
                await axios.get(`/api/supervisors/${this._id}/edit`)
                    .then(res => {
                        this.supervisor = res.data.supervisor
                        this.abilities = res.data.userAbilities
                        this.supervisor.password = null
                    }).catch(err => {
                        console.log(err)
                        console.log("error to get supervisor")
                    })
            }
        },
        mounted() {

            document.name = "Store | supervisor - Create"
            this.getsupervisor()

        },
        watch: {
            '_id': function () {
                this.getsupervisor()
            }
        }

    }

</script>

<style>

</style>
