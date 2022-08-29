<template>
    <div class="col-md-12 col-lg-12 col-sm-12 ">
        <div class="container">
            <div class="row">

                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="row justify-content-center">

                        <div v-if="reset-sent" class="alert alert-success alert-dismissible fade show">
                            <strong>{{message}}</strong>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>


                        <div class="col-md-4 col-lg-4 col-sm-12 ">
                            <form>

                                <div class="form-group">
                                    <input type="Email" class="form-control" placeholder="Email.." v-model="email">
                                </div>
                                <div class="form-group">
                                    <button :disabled="processing" @click.once.prevent="sendLink()"
                                        class="btn btn-outline-primary form-control">
                                        {{processing ? 'Sending...' : 'Send Password Reset Link' }}</button>
                                </div>

                            </form>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>


</template>

<script>

export default {
    data : function (){
        return {
            email : '',
            processing : false
        }
    },
    methods : {
        sendLink (){
            this.processing = true
            axios.post("/api/forgot-password",this.email).then(res=>{

            }).catch(err=>{

            }).finally(()=>{
                this.processing = false
            })
        }
    }
}

</script>
