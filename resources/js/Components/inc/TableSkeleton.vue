<template>
    <table style="width:100%" class="skeleton">

        <thead>
            <tr class="skeleton-loader">

                <th v-for="n,i in parseInt(cols)" :key="i"><div class="placeholder"></div></th>

            </tr>
        </thead>
        <tbody>
            <!-- Skeleton Loader -->
            <tr  class="skeleton-loader" v-for="n,i in parseInt(cols)" :key="i">
                <td v-for="n,i in parseInt(cols)" :key="i"><div class="placeholder"></div></td>
            </tr>
            <!-- End Skeleton Loader -->
        </tbody>
    </table>
</template>
<script setup>

defineProps({
    cols : String
})

</script>
<style scoped>

.skeleton {

    border : 3px solid #eee;
    padding: 10px;
    border-spacing: 100px;
}
td ,th{
    padding: 11px;
}

 th{
    padding: 20px 16px;
    border-bottom: 3px solid #eee;
}
td .placeholder  {
    background: #e0dddd;
    border-radius: 3px;
    padding: 15px 20px;
    animation: bg-pulse 1.8s infinite ease-in-out;
}

th .placeholder{
    background-color: #c5c5c5;
    padding: 17px 20px;
    border-radius: 3px;
}

@keyframes bg-pulse{

    0%{
        background-color:  #c7c6c6;

    }
    50%{
        background-color:  #dfd4d4;

    }
    100%{
        background-color:  #c7c6c6;

    }

}
</style>
