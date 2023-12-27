<template>
  <router-view></router-view>
</template>

<script>
import { defineComponent } from "vue";
import { useAuthStore } from "./store/auth";
import { useAdminAuthStore } from "./store/admin/auth";
import { useCartStore } from "./store/cart";
import jwtDecode from "jwt-decode";

export default defineComponent({
  created() {
    this.userLogin()
    this.adminLogin()
  },
  watch: {
    '$store.uAuth.user': function (newUser) {
      console.log('User has changed:', newUser);
    },
  },
  methods: {
    async userLogin() {
      try {
        const uToken = await localStorage.getItem("uToken");
        if (uToken) {

          const tokenExpiration = jwtDecode(uToken).exp;
          const currentTimestamp = Date.now();
          if (tokenExpiration && tokenExpiration > currentTimestamp) {
            console.log('Logged')
            useAuthStore().setToken(uToken);
            useAuthStore().setUser(uToken);
            useCartStore().fetchCartData();
          } else {
            console.log("logout");
            useAuthStore().logout();
          }

        } else {
          useAuthStore().logout();
        }
      } catch (error) {
        console.log("Err: ", error)
      }
    },

    async adminLogin() {
      try {
        const aToken = await localStorage.getItem("aToken");
        if (aToken) {

          const tokenExpiration = jwtDecode(aToken).exp;
          const currentTimestamp = Date.now();
          if (tokenExpiration && tokenExpiration > currentTimestamp) {
            console.log('Logged')
            useAdminAuthStore().setToken(aToken);
            useAdminAuthStore().setUser(aToken);
            useCartStore().fetchCartData();
          } else {
            console.log("logout");
            useAdminAuthStore().logout();
          }

        } else {
          useAdminAuthStore().logout();
        }
      } catch (error) {
        console.log("Err: ", error)
      }
    }
  },
});
</script>

<style></style>
