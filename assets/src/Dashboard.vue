<template>
  <div id="dashboard">
    <div style="background:#ECECEC; padding:30px">
      <a-card title="유명인 등록" :bordered="false" style="width: 100%">
        <a-input-search placeholder="목소리를 녹음할 유명인을 입력" @search="addCeleb" size="large">
          <a-button slot="enterButton">유명인 등록</a-button>
        </a-input-search>
        <a-list
          class="demo-loadmore-list"
          itemLayout="horizontal"
          :dataSource="celebs"
        >
          <a-list-item slot="renderItem" slot-scope="item, index">
            <a slot="actions" @click="editCeleb(item)">수정</a>
            <a slot="actions" @click="removeCeleb(item)">삭제</a>
            <a-list-item-meta>
              <a slot="title">{{item}}</a>
            </a-list-item-meta>
          </a-list-item>
        </a-list>
      </a-card>
    </div>
    
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: "dashboard",
  data() {
    return {
      celebs: [],
      sources: []
    };
  },
  created() {
    this.listCelebs();
    this.listSources();
  },
  methods: {
    listCelebs: () => {
      axios.get('/api/celebs').then(response => {
        this.celebs = response.data;
      })
    },
    listSources: () => {
      axios.get('/api/sources').then(response => {
        this.sources = response.data;
      });
    },
    addCeleb: (celeb_name) => {
      axios.post('/api/celeb', {"celeb_name": celeb_name}).then(response => {
        console.log(response);
      })
    },
    editCeleb: (index) => {
      axios.put('/api/celeb', {"celeb_name": celeb_name}).then(response => {
        console.log(response);
      })
    },
    removeCeleb: (index) => {
      axios.delete('/api/celeb', {"celeb_name": celeb_name}).then(response => {
        console.log(response);
      })
    }
  }
};
</script>

<style lang="scss">
</style>