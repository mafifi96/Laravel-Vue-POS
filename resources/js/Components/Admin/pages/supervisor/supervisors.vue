<template>
<div>
        <!-- Begin Page Content -->
        <div class="container-fluid">
            <!-- Page header -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">supervisors</h1>
                <router-link :to="{name : 'admin.supervisors.create'}"
                    class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i class="fas fa-plus fa-sm "></i>
                    Create supervisor</router-link>
            </div>
            <!-- Content Row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h6 class="h6 text-muted">All supervisors</h6>
                        </div>
                        <div class="card-body table-responsive">
                            <table class="table table-bordered text-center">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">name</th>
                                        <th scope="col">phone</th>
                                        <th scope="col">email</th>
                                        <th scope="col">address</th>
                                        <th scope="col">Careated At</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr v-for="(supervisor , index) in supervisors" :key="index">
                                        <td scope="row">{{(index + 1)}}</td>
                                        <td>
                                            <router-link :to="{name : 'admin.supervisors.supervisor' , params : {id : supervisor.id}}">
                                                {{supervisor.name}}</router-link>
                                        </td>
                                        <td>{{supervisor.phone ?? 'Not Provided'}}</td>
                                        <td>{{supervisor.email ?? 'Not Provided'}}</td>
                                        <td>{{supervisor.address ?? 'Not Provided'}}</td>
                                        <td>{{formateDate(supervisor.created_at)}}</td>

                                        <td>
                                            <div class="btn-group">
                                                <router-link
                                                    :to="{name : 'admin.supervisors.edit', params : {id : supervisor.id}}"
                                                    class="btn btn-primary">
                                                    <i class="fas fa-edit"></i>
                                                </router-link>
                                                <a @click.prevent="warning(supervisor.id)" :data-id="supervisor.id"
                                                    class="btn btn-danger "><i class="fas fa-trash"></i>
                                                </a>

                                            </div>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>

        </div>
        <!-- /.container-fluid -->
    </div>


</template>

<script>
import moment from 'moment'

export default {
    data : () => ({
        supervisors : {},
    }),
    methods: {
            getsupervisors() {
                axios.get("/api/supervisors").then(res => {

                    this.supervisors = res.data.supervisors;

                }).catch(err => {
                    console.log(err)
                })
            },
            warning(id) {

                Swal.fire({
                    title: 'Warning!',
                    text: 'Do you want to delete this supervisor!',
                    icon: 'warning',
                    confirmButtonText: 'yes',
                    showCancelButton: true
                }).then(res => {
                    if (res.isConfirmed) {
                        this.deletesupervisor(id)
                    }
                })
            },
            async deletesupervisor(id) {

                await axios.delete(`/api/supervisors/${id}`).then(res => {

                    Swal.fire({
                        title: 'deleted!',
                        text: 'supervisor Deleted Successfully..!',
                        icon: 'success',
                        showCancelButton: true
                    })
                    this.getsupervisors()
                }).catch(err => {

                    Swal.fire({
                        title: 'error!',
                        text: 'something went wrong..!',
                        icon: 'error',
                        showCancelButton: true
                    })

                })

            },
            formateDate(date) {
                return moment(date).format('MMMM Do YYYY, h:mm:ss a');
            }
        },
        mounted() {
            this.getsupervisors()
            document.title = "Store | supervisors"

        }
}
</script>

<style>

</style>
