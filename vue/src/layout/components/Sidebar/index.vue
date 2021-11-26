<template>
  <div :class="{'has-logo':showLogo}">
    <logo v-if="showLogo" :collapse="isCollapse"/>
    <el-scrollbar wrap-class="scrollbar-wrapper">
      <el-menu
        @select="select"
        @open="open"
        @close="close"
        :default-active="activeMenu"
        :default-openeds="openedArr"
        :collapse="isCollapse"
        :background-color="variables.menuBg"
        :text-color="variables.menuText"
        :unique-opened="true"
        :active-text-color="variables.menuActiveText"
        :collapse-transition="false"
        mode="vertical"
        ref="sideBar">
        <sidebar-item v-for="route in routes" :key="route.path" :item="route" :base-path="route.path"/>
      </el-menu>
    </el-scrollbar>
  </div>
</template>

<script>
  import {mapGetters} from 'vuex';
  import Logo from './Logo';
  import SidebarItem from './SidebarItem';
  import variables from '@/styles/variables.scss';
  import store from "../../../store";

  export default {
    components: {SidebarItem, Logo},
    computed: {
      ...mapGetters([
        'sidebar'
      ]),
      routes() {
        return store.getters.addRouters;
      },

      activeMenu() {
        const route = this.$route;
        const {meta, path} = route;
        // if set path, the sidebar will highlight the path you set
        if (meta.activeMenu) {
          return meta.activeMenu;
        }
        return path;
      },
      showLogo() {
        return this.$store.state.settings.sidebarLogo;
      },
      variables() {
        return variables;
      },
      isCollapse() {
        return !this.sidebar.opened;
      },
    },
    data() {
      return {
        openedArr: []
      };
    },
    mounted() {
      // console.warn('refs', this.$refs);
    },
    methods: {
      select(path, pathArr) {
        let opendMenu = this.$refs["sideBar"].openedMenus[0];
        if (this.activeMenu == path) {
          return;
        } else {
          this.$refs["sideBar"].closeMenu(opendMenu);
        }
      },
      open(index, path) {
        console.warn('open:', index, path);
      },
      close(index, path) {
        console.warn('close:', index, path);
      },
    },
  };
</script>
