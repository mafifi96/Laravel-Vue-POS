<template>
    <div>

        <component :is="layout"></component>

    </div>
</template>
<script>
    import StoreLayout from './Layouts/StoreLayout.vue'
    import AdminLayout from './Layouts/AdminLayout.vue'
    import CustomerLayout from './Layouts/CustomerLayout.vue'

    export default {
        components: {
            StoreLayout,
            AdminLayout,
            CustomerLayout
        },
        data: function () {
            return {
                DefaultLayout: "StoreLayout"
            }
        },
        computed: {
            layout() {
                return this.$route.meta.layout ? this.$route.meta.layout : this.DefaultLayout
            }
        },
        mounted() {

        }

    }

</script>
