<template>
  <div class="intro">
    <h1>
      I’m a fullstack web developer
      <br />
      <span class="intro-headline-primary">from the Germany.</span>
    </h1>
  </div>
  <p class="hero-subheadline">
    Interested in programming and to code inclusive, effective, and impactful digital
    products. Logical approach to problem solving is my passion. Code perfectionist in the
    best sense of the word.
  </p>
  <ul v-if="works.isReady" class="grid">
    <li v-for="album in works.children" :key="album.uri">
      <router-link :to="`/${album.uri}`">
        <figure>
          <img :src="album.cover.urlHome" :alt="album.cover.alt" />

          <figcaption>
            <span>
              <span class="example-name">{{ album.title }}</span>
            </span>
          </figcaption>
        </figure>
      </router-link>
    </li>
  </ul>
  <div v-else>Loading …</div>
</template>

<script>
import { usePage } from "~/hooks";

export default {
  setup() {
    const page = usePage();
    const works = usePage("works");

    // Example of `isReadyPromise()` page method
    (async () => {
      await works.isReadyPromise();
      // Do something with the reactive page object
      console.log("works page data has been loaded.");
      console.log(works.title);
    })();

    return {
      page,
      works,
    };
  },
};
</script>

<style lang="scss">
.grid {
  display: grid;
  list-style: none;
  grid-gap: 1rem;
  line-height: 0;
  grid-template-columns: repeat(1, 1fr);
  grid-auto-flow: dense;
  li {
    position: relative;
    --cols: 1;
    --rows: 1;
    overflow: hidden;
    background: #000;
    line-height: 0;
    &:first-child {
      --cols: 2;
      --rows: 2;
    }
    &:nth-child(5) {
      --cols: 2;
    }
    &:nth-child(6) {
      --rows: 2;
    }
    &:nth-child(7) {
      --cols: 2;
    }
  }
  a {
    display: block;
    height: 10rem;
  }
  img {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: all 0.3s;
  }
  figcaption {
    display: flex;
    align-items: center;
    justify-content: center;
    position: absolute;
    color: #fff;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    line-height: 1;
    text-align: center;
    background: rgba(0, 0, 0, 0.5);
    text-transform: uppercase;
    font-size: 0.875rem;
    letter-spacing: 0.125em;
    font-weight: 600;
  }
}
@media screen and (min-width: 45em) {
  .grid {
    grid-template-columns: repeat(3, 1fr);
    li {
      grid-column-start: span var(--cols);
      grid-row-start: span var(--rows);
    }
    a {
      padding-bottom: 52.65%;
    }
  }
}
</style>
