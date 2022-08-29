<template>
    <div>
    <Nav></Nav>
        <main class="mt-5 mb-5 px-3" style="overflow:hidden;">
            <div class="container">
                <div class="row">

                    <router-view></router-view>

                </div>
            </div>
        </main>
        <Footer></Footer>
    </div>
</template>

<script>
    import Nav from '../Components/inc/Nav.vue'
    import Footer from '../Components/inc/Footer.vue'

    export default {
        components: {
            Nav,
            Footer
        }
    }

</script>
