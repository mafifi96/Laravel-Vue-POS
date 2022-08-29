<template>

    <nav class="navbar navbar-expand-lg navbar-light justify-content-center bg-light shadow-sm">

            <div class="justify-content-between">

            <div>
            <select v-model="_lang" @change="Lang()" class="form-select form-select-md d-flex">
                <option value="ar" :selected="_lang == 'ar'">
                    ar</option>
                <option value="en" :selected="_lang == 'en'">
                    en</option>
            </select>
            </div>
            </div>

    </nav>

</template>

<script>
    import {
        mapGetters,
        mapActions,
        mapState
    } from 'vuex'

    import { loadLanguageAsync } from 'laravel-vue-i18n';

    export default {
        data: function () {
            return {
                _lang: this.$store.getters.getLang
            }
        },
        methods: {
            ...mapActions({
                updateLang: 'setLang'
            }),
            Lang() {
                this.updateLang(this._lang)
                loadLanguageAsync(this._lang)

            },
            changeDir(){
                let _html = document.querySelector("html")
                if(this._lang == "en")
                {
                    _html.dir = "ltr"
                    _html.lang = "en"

                }else if(this._lang == "ar")
                {
                    _html.dir = "rtl"
                    _html.lang = "ar"
                     document.head.innerHTML += `
                     <meta charset="utf-8">
                    link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.rtl.min.css" integrity="sha384-gXt9imSW0VcJVHezoNQsP+TNrjYXoGcrqBZJpry9zJt8PCQjobwmhMGaDHTASo9N" crossorigin="anonymous">
                    `
                }
            }

        },
        watch : {
            '_lang' : function()
            {
                this.changeDir()
            }
        },
        mounted()
        {
            this.changeDir()
        }
    }

</script>


<style scoped>

</style>
