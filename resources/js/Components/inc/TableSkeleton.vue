<template>
    <table cellpadding="2" cellspacing="2" style="width:100%" class="skeleton">
        <thead>
            <tr class="skeleton-loader">
                <th><div class="placeholder"></div></th>
                <th><div class="placeholder"></div></th>
                <th><div class="placeholder"></div></th>
                <th><div class="placeholder"></div></th>
                <th><div class="placeholder"></div></th>
            </tr>
        </thead>
        <tbody>
            <!-- Skeleton Loader -->
            <tr class="skeleton-loader">
                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>

            </tr>
            <tr class="skeleton-loader">
                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>

                <td><div class="placeholder"></div></td>
            </tr>
            <tr class="skeleton-loader">
                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>

                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>
            </tr>
            <tr class="skeleton-loader">
                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>

                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>
            </tr>
            <tr class="skeleton-loader">
                <td><div class="placeholder"></div></td>

                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>
                <td><div class="placeholder"></div></td>
            </tr>

            <!-- End Skeleton Loader -->
        </tbody>
    </table>
</template>
<style scoped>

.skeleton {
    
    border : 3px solid #eee;
    padding: 10px;
    border-spacing: 100px;
}
td ,th{
    padding: 15px;}

 th{
    padding: 20px 16px;
    border-bottom: 2px solid #eee;
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
        background-color:  #c5c5c5;
        
    }
    50%{
        background-color:  #9e9b9b;
        
    }
    100%{
        background-color:  #c5c5c5;
        
    }
    
}
</style>