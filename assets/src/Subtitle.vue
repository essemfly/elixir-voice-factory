<template>
  <div id="subtitle">
    <h3>안녕 테스트 친구들?</h3>
    <a-time-picker :defaultValue="moment('23:01:12', 'HH:mm:ss')" format="HH:mm:ss" />
  </div>
</template>

<script>
export default {
  name: "subtitle",
  data() {
    return {};
  },
  async created() {},
  methods: {}
};
</script>

<style lang="scss">
</style>