<template>
  <header class="header">
    <router-link to="/" class="logo">
      {{ site.title }}
    </router-link>

    <nav id="menu" class="menu">
      <router-link
        v-for="page in site.children.filter((page) => page.isListed)"
        :key="page.uri"
        :to="`/${page.uri}`"
        :class="{
          'router-link-active': route.path.startsWith(`/${page.uri}/`),
        }"
      >
        {{ page.title }}
      </router-link>
    </nav>
  </header>
</template>

<script setup>
import { useRoute } from "vue-router";
import { useSite } from "~/hooks";

const site = useSite();
const route = useRoute();
</script>

<style lang="scss">
.header {
  margin-bottom: 1.5rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  a {
    position: relative;
    text-transform: uppercase;
    font-size: 0.875rem;
    letter-spacing: 0.05em;
    padding: 0.5rem 0;
    font-weight: 700;
  }
  .logo {
    display: block;
    margin-bottom: 1.5rem;
    padding: 0.5rem 0;
  }
}
.menu {
  a {
    margin: 0 0.75rem;
    &[aria-current="page"] {
      border-bottom: 2px solid #000;
    }
    &.router-link-active {
      border-bottom: 2px solid #000;
    }
  }
}
@media screen and (min-width: 40rem) {
  .header {
    .logo {
      margin-bottom: 0;
    }
    flex-direction: row;
    justify-content: space-between;
  }
  .menu {
    margin-right: -0.75rem;
  }
}
</style>
