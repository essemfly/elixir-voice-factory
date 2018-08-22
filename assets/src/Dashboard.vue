<template>
  <div id="dashboard">
    <h3>안녕 친구들?</h3>
    <a-time-picker :defaultValue="moment('23:01:12', 'HH:mm:ss')" format="HH:mm:ss" />

  </div>
</template>

<script>
import moment from 'moment';

export default {
  name: "dashboard",
  data() {
    return {
      moment: moment
    };
  },
  methods() {
  },
  async created() {},
  methods: {}
};
</script>

<style lang="scss">
</style>