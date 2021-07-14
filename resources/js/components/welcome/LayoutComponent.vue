<template>
  <div class="container-xl mt-4">
    <div class="row">
      <aside class="col-md-3">
        <left-menu-component></left-menu-component>
      </aside>
      <main class="col-md-9">
        <router-view></router-view>
      </main>
    </div>

    <carousel-component></carousel-component>
  </div>
</template>

<script>
import CarouselComponent from "./CarouselComponent.vue";
import LeftMenuComponent from "./LeftMenuComponent.vue";
export default {
  components: {
    CarouselComponent,
    LeftMenuComponent,
  },
};
</script>