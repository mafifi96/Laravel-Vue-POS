<template>
    <div class="col-md-12 col-lg-12 col-sm-12 ">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 ">
                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->

                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">

                                            <div class="alert alert-danger"
                                                v-if="errors && (errors.email || errors.password || errors.message)">
                                                <ul>
                                                <template v-for="v in errors">
                                                    <li v-for="error in v" :key="error" class="text-sm">
                                                        {{ error }}
                                                    </li>
                                                </template>
                                                </ul>
                                            </div>


                                        <form class="user" @submit.prevent="register" method="post">

                                            <div class="form-group ">

                                                <input type="text"  v-model="creds.name"
                                                    class="form-control form-control-user" id="exampleFirstName"
                                                    placeholder="Name">
                                            </div>
                                            <div class="form-group">
                                                <input type="email"  v-model="creds.email"
                                                    class="form-control form-control-user" id="exampleInputEmail"
                                                    placeholder="Email Address">
                                            </div>
                                            <div class="form-group">

                                                <input type="password"  v-model="creds.password"
                                                    class="form-control form-control-user" id="exampleRepeatPassword"
                                                    placeholder="Password">

                                            </div>
                                            <button :disabled="processing" @click.once.prevent="register()"
                                                 class="btn btn-primary btn-user btn-block">
                                                {{processing ? 'Registering...' : 'Register'}}
                                            </button>
                                        </form>
                                    </div>
                                </div>
                                <hr>
                                <div class="text-center">
                                    <router-link class="small" :to="{name : 'forgot-password'}">Forgot Password?
                                    </router-link>
                                </div>
                                <div class="text-center">
                                    <router-link class="small" :to="{name : 'login'}">Already have an account? Login!
                                    </router-link>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</template>


<script>

    import {
        mapActions
    } from 'vuex'

    export default {

        data() {
            return {
                errors: null,
                creds: {
                    name: '',
                    email: '',
                    password: '',
                },
                csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                processing: false
            }
        },
        methods: {
            ...mapActions({
                signIn : 'login'
            })
            ,
            async register() {
                this.processing = true;
                //await axios.get('/sanctum/csrf-cookie')
                await axios.post("/api/register",this.creds).then(res => {
                    window.axios.defaults.headers.common = {'Authorization': `Bearer ${res.data.token}`}
                     this.signIn()
                     console.log(res.data.token)
                     console.log("succeded")
                }).catch(err => {
                    this.errors = err.response.data.errors;
                    console.log(err)
                    console.log("failed to register")
                }).finally(()=>{
                    this.processing = false
                })
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
        watch: {
            '$store.getters.authenticated': function () {
                this.redirectAuth()
            }
        },
        created(){

            document.title = "Store | Register"
        },
        mounted() {
            this.redirectAuth()
        }



    }

</script>
