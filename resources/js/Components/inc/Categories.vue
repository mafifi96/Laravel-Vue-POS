<template>
    <div class="col-md-2 col-sm-12 col-lg-2 mt-1">
        <div class="side-bar p-2 mb-3 shadow-sm">

            <ul>

                <!--                            <li v-if="isCustomer"><a href="/customer/{{ user.id }}/orders"
                                    class="text-decoration-none">Orders</a></li>
-->
                <li v-for="category in categories" v-bind:key="category.id">
                    <router-link :to="{name : 'category' , params : {id: category.id , name : category.name}}" class=" text-decoration-none">
                        {{ category.name }}
                        </router-link>
                </li>
            </ul>
        </div>
    </div>

</template>

<script>

    export default {
        data() {
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
            }
        },
        mounted() {
            this.getCategories()

        }
    }

</script>

<style scoped>

</style>
