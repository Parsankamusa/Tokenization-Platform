<template>
  <div id="app">
    <Hero />
    <Eutherium />
    <FeaturesSection />
  </div>
</template>

<script>
import Hero from "./components/HomePage/Hero.vue";
import Eutherium from "./components/HomePage/Eutherium.vue";
import FeaturesSection from "./components/HomePage/FeaturesSection.vue";

export default {
  components: {
    Hero,
    Eutherium,
    FeaturesSection,
  },
};
</script>

<style>
body {
  font-family: 'Inter', sans-serif;
}
</style>