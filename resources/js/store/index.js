import {
    createStore
} from 'vuex'

import createPersistedState from 'vuex-persistedstate'

const store = createStore({
    plugins: [
        createPersistedState()
    ],
    state() {
        return {
            CartQuantity: 0,
            authenticated: false,
            user: {},
            _lang : 'en',
            _translate : {},

        }
    },
    mutations: {

        UPDATE_QUANTITY(state, payload) {
            state.CartQuantity = payload
        },
        SET_AUTHENTICATED(state, payload) {
            state.authenticated = payload
        },
        SET_USER(state, payload) {
            state.user = payload
        },
        SET_LANG(state, payload){
            state._lang = payload
        },
        SET_TRANSLATE(state, payload){
            state._translate = payload
        }

    },
    actions: {
        Quantity({commit}) {
            axios.post("/api/cart/quantity").then(res => {

                commit("UPDATE_QUANTITY", Number(res.data.quantity))

            }).catch(err => {

                console.log("failed to get quantity!")

                console.log(err)

            })
        },

        login({
            commit
        }) {

            axios.get('/api/user').then(res => {

                console.log("logging...")
                commit('SET_USER', res.data)
                commit('SET_AUTHENTICATED', true)

                console.log("should be logged - ")

            }).catch(err => {
                console.log(err)

                commit('SET_USER', {})
                commit('SET_AUTHENTICATED', false)

                console.log("loggin failed - ")

            })
        },
        logout({
            commit
        }) {
            commit('SET_USER', {})
            commit('SET_AUTHENTICATED', false)
        },
        setLang({
            commit
        } , _lang) {
            axios.post('/api/setLang', {
                _lang: _lang
            }).then(res => {
                commit('SET_LANG', _lang)
            }).catch(err => {
                console.log("cant fetch lan")
            })

        }
    },
    getters: {
        quantity(state) {
            return state.CartQuantity
        },
        authenticated(state) {
            return state.authenticated
        },
        user(state) {
            return state.user
        },
        isAdmin(state) {
            if (Object.keys(state.user).length != 0) {
                return state.user.roles[0].name == "admin" ? true : false;
            }
            return false
        },
        isCustomer(state) {
            if (Object.keys(state.user).length != 0) {
                return state.user.roles[0].name == "customer" ? true : false;
            }
            return false
        },
        getLang(state){
            return state._lang
        },
        get_translate(state)
        {
            return state._translate
        }
    }
})

export default store
