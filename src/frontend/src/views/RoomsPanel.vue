<template>
    <div id="full">
      <div id="left_bar">
            <div id="left_bar_content">
                <div class="left_bar_text"><router-link to="/admin/reservations">Reservations</router-link></div>
                <hr style="width: 200px; height: 0px;
        border: none;
        border-top: 2px solid rgba(60,60,73,1);">
                <div class="left_bar_text"><router-link to="/admin/guests">Guests</router-link></div>
                <hr style="width: 200px; height: 0px;
        border: none;
        border-top: 2px solid rgba(60,60,73,1);">
                <div class="left_bar_text"><router-link to="/admin/rooms">Rooms</router-link></div>
                <hr style="width: 200px; height: 0px;
        border: none;
        border-top: 2px solid rgba(60,60,73,1);">
                <div class="left_bar_text"><router-link to="/admin/orders">Orders</router-link></div>
                <hr style="width: 200px; height: 0px;
        border: none;
        border-top: 2px solid rgba(60,60,73,1);">
                <div class="left_bar_text"><router-link to="/admin/manage">Manage other data</router-link></div>
            </div>
        </div>
          <div id="content">
              <div id="navbar">
                  <span> Rooms</span> /
              </div>
              <div id="title">Rooms</div>
              <ag-grid-vue
                  class="ag-theme-alpine" id="table"
                  :columnDefs="columnDefs"
                  :rowData="rowData.value"
                  @rowClicked="onRowClicked"
              >
              </ag-grid-vue>
          </div>
    </div>
</template>

<script>
import "ag-grid-community/dist/styles/ag-grid.css";
import "ag-grid-community/dist/styles/ag-theme-alpine.css";
import { AgGridVue } from "ag-grid-vue3";
import {reactive, onMounted} from "vue";


export default {
  name: "ReservationsPanel",
  components: {
    AgGridVue,
  },
  setup() {
    let rowData = reactive([]);


    onMounted(() => {
        fetch('/api/room/all')
          .then(result => result.json())
          .then(remoteRowData => rowData.value = remoteRowData);
    })

    return {
        columnDefs: [
          { field: 'roomNumber', sortable: true, filter: true, resizable: true,type: 'rightAligned', width: 150 },
          { field: 'roomName', sortable: true, filter: true, resizable: true,type: 'rightAligned', width: 200 },
          { field: 'pricePerNight', sortable: true, filter: true, resizable: true,type: 'rightAligned',width: 150 },
          { field: 'totalPrice', sortable: true, filter: true, resizable: true,type: 'rightAligned', width: 125 },
          { field: 'singleBeds', sortable: true, filter: true, resizable: true,type: 'rightAligned', width: 125 },
          { field: 'doubleBeds', sortable: true, filter: true, resizable: true,type: 'rightAligned', width: 140 },
      ],
      rowData
    };
  },
  created() {
    this.rowSelection = 'single';
  },
  methods: {
    onSelectionChanged() {
      const selectedRows = this.rowData.getSelectedRows();
      console.log(selectedRows.length === 1 ? selectedRows[0].reservation_id : '');
    },
    onRowClicked(params) {
      console.log(params.node.data.roomNumber);
      this.$router.push({ path: '/admin/rooms/' + params.node.data.roomNumber });
    }
  },
};
</script>

<style scoped>
    body{
        margin: 0;
        padding: 0;
        font-family: sans-serif;
    }

    #full{
        width: 100vw;
        height: 100vh;
        display: grid;
        grid-template-columns: 250px 1fr;
        grid-template-rows: 1fr;
    }

    #left_bar{
        background-color: #080A0D;
        grid-area: 1/1/1/1;
        display: grid;
        grid-template-rows: 200px 1fr;
    }

    #left_bar_content{
        grid-area: 2/1/3/2;
    }

    .left_bar_text{
        font-size: 18px;
        text-align: left;
        margin-left: 30px;
        margin-bottom: 10px;
    }

    a{
      text-decoration: none !important;
      color: #DBDEE6;
    }

    a:hover{
      color: #abb1c2;
    }

    hr{
        margin: 0;
        margin-bottom: 20px;
        height: 0px;
        border: none;
        border-top: 1px solid rgba(40,50,63,0.3);
    }

    #navbar{
        grid-area: 1/2/2/3;
        padding-top: 20px;
        text-align: left;
    }

    #navbar a:focus {
        color: #005EF5;
    }

    #navbar a:visited {
        color: #005EF5;
    }

    #content{
        background-color: #DBDEE6;
        grid-area: 1/2/1/2;
        display: grid;
        grid-template-columns: 50px 400px 400px 600px 1fr;
        grid-template-rows: 70px 1fr 340px 340px 1fr;
        grid-gap: 20px;
    }

    #title{
        font-size: 30px;
        font-weight: 600;
        grid-area: 2/2/3/3;
        align-self: end;
        justify-self: start;
    }

    #table{
        background: #EBEBEB;
        grid-area: 3/2/5/5;
        cursor: pointer;
    }

</style>