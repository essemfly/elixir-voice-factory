<template>
  <div id="landing">
    <h2>정빈이가 얼마나 밥을 먹었는지 한번 확인해볼까?</h2>
    <div>
      <p>정빈이가 먹은 양과 시간을 입력해주세요</p>
      <input v-model="meal_type" placeholder="분유/모유">
      <input v-model="volume" placeholder=120>
      <input v-model="child_name" placeholder="정빈">
      <input v-model="ate_at" placeholder="201808091637">
      <button v-on:click="record_meal">저장</button>
    </div>
    <div>
      <ul>
        <li v-for="history in histories">
          <p>
            {{history.child_name}}, {{history.meal_type}}, {{history.volume}}, {{history.ate_at}}
          </p>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: "landing",
  data() {
    return {
      meal_type: "분유",
      volume: 0,
      child_name: "이정빈",
      ate_at: "",
      histories: []
    };
  },
  async created() {
    let action_records = await this.$parent.eos.getActions("daybit")
    this.histories = action_records.actions.map(
      action => action.action_trace.act.data
    );
    console.log(this.histories);
  },
  methods: {
    record_meal: async function() {
      let tx_write = await this.$parent.eos.transaction("daybit", daybit => {
        daybit.write(
          "daybit",
          this.meal_type,
          this.child_name,
          Number(this.volume),
          this.ate_at,
          this.$parent.options
        );
      });
    }
  }
};
</script>

<style lang="scss">
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
h1,
h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>