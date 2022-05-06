<template>
  <header class="intro">
    <h1><slot /></h1>
  </header>
</template>

<style lang="scss">
.intro {
  padding: 10vh 0 2vh 0;
  text-align: start;
}

.intro {
  h1 {
    position: relative;
    margin-bottom: 1rem;
    font-weight: 900;
    font-size: calc(1vw + 2rem);
    z-index: 1;
  }
}
</style>
