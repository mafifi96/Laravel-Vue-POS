<template>
    <div class="col-md-9 col-lg-9 col-sm-12">
        <div class="container">
            <div class="row ">
                <div class="col-md-12 col-sm-12 col-lg-12">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Checkout</h1>
                    </div>

                    <div class="card">
                        <div class="card-header">
                            <h6 class="h6 text-muted">Fill Your Information</h6>

                            <div v-show="errors && errors.msg" class="alert alert-danger">
                                {{ errors.msg }}
                            </div>

                        </div>
                        <div class="card-body">
                            <form enctype="multipart/form-data">

                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" v-model="formData.name"
                                        placeholder="name" required>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control form-control-user" v-model="formData.email"
                                        placeholder="email" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control form-control-user"
                                        v-model="formData.password" placeholder="password" required>
                                </div>
                                <div class="form-group">
                                    <input type="file" class="form-control form-control-user" @change="filechanged($event)"
                                        placeholder="profile picture (optional)">
                                </div>
                                <div class="form-group">
                                    <input type="tel" class="form-control form-control-user" v-model="formData.phone"
                                        placeholder="phone number" required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control form-control-user" v-model="formData.address"
                                        type="address" required placeholder="address">
                                </div>

                                <div class="form-group">
                                    <select v-model="formData.pm_type" class="form-control form-control-user">
                                        <option value="" selected>--Payment Method--</option>
                                        <option value="cash">Cash</option>
                                        <option value="credit_card">Credit Card</option>
                                    </select>
                                </div>

                                <button @click.once.prevent="Checkout()" :disabled=processing type="submit"
                                    class="btn btn-primary btn-user btn-block">
                                    {{processing ? "saving..." : "save"}}
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- /.container-fluid -->

    </div>


</template>
<script>


import {mapActions} from 'vuex'

    export default {

        data: function () {
            return {
                errors: {},
                processing : false,
                csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                formData: {
                    name: '',
                    email: '',
                    password: '',
                    address: '',
                    image: '',
                    phone: '',
                    pm_type: '',

                }
            }
        },
        methods: {
            ...mapActions({
                signIn : 'login'
            }),
            async Checkout() {

                this.processing = true

                await axios.post("/api/customer/info" , this.formData).then(res=>{

                    this.signIn()

                    console.log(res.data.message + ' status ' + res.data.status )

                }).catch(err => {
                    consol.log(err)
                }).finally(()=>{
                    this.processing = false
                })

            },
            filechanged(event) {

                this.formData.image = event.target.files[0];

            },
            redirectAuth() {
                if (this.$store.getters.isAdmin) {
                    this.$router.push({
                        name: 'dashboard'
                    })

                } else if (this.$store.getters.isCustomer) {
                    this.$router.push({
                        name: 'customer'
                    })
                }
            }
        },
        watch:{
            '$store.getters.authenticated' : function(){
                this.redirectAuth()
            }
        },
        mounted() {
            this.redirectAuth()
            document.title = "Store | Checkout"
        }

    }

</script>
