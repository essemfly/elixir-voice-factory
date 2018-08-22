<template>
  <a-layout id="components-layout-demo-custom-trigger">
    <a-layout-sider
      :trigger="null"
      collapsible
      v-model="collapsed"
    >
      <div class="logo" />
      <a-menu theme="dark" mode="inline" :defaultSelectedKeys="[this.pathname]">
        <a-menu-item key="/dashboard">
          <a href="/dashboard">
            <a-icon type="user" />
            <span>영상 및 유명인 등록</span>
          </a>
        </a-menu-item>
        <a-menu-item key="/subtitle">
          <a href="/subtitle">
            <a-icon type="video-camera" />
            <span>자막 등록</span>
          </a>
        </a-menu-item>
      </a-menu>
    </a-layout-sider>
    <a-layout>
      <a-layout-header style="background: #fff; padding: 0">
        <a-icon
          class="trigger"
          :type="collapsed ? 'menu-unfold' : 'menu-fold'"
          @click="()=> collapsed = !collapsed"
        />
      </a-layout-header>
      <a-layout-content :style="{ margin: '24px 16px', padding: '24px', background: '#fff', minHeight: '280px' }">
        <component v-bind:is="currentPath"></component>
      </a-layout-content>
    </a-layout>
  </a-layout>
</template>

<script>
import Dashboard from "./Dashboard.vue";
import Subtitle from "./Subtitle.vue";
import moment from "moment";

export default {
  data() {
    return {
      pathname: window.location.pathname,
      collapsed: false
    };
  },
  computed: {
    currentPath: () => {
      let route = window.location.pathname
      switch(route) {
        case "/dashboard":
          return "dashboard"
        case "/subtitle":
          return "subtitle"
        default:
          return "dashboard"
      }
    }
  },
  components: {
    dashboard: Dashboard,
    subtitle: Subtitle,
  }
};
</script>

<style>
#components-layout-demo-custom-trigger {
  height: 100%;
}

#components-layout-demo-custom-trigger .trigger {
  font-size: 18px;
  line-height: 64px;
  padding: 0 24px;
  cursor: pointer;
  transition: color 0.3s;
}

#components-layout-demo-custom-trigger .trigger:hover {
  color: #1890ff;
}

#components-layout-demo-custom-trigger .logo {
  height: 32px;
  background: rgba(255, 255, 255, 0.2);
  margin: 16px;
}
</style>