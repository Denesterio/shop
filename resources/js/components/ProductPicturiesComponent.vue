<template>
  <div class="d-flex flex-column justify-content-center">
    <div
      class="picture-container d-flex justify-content-center align-items-center"
    >
      <img class="main-image" :src="picturePath" :alt="title" />
    </div>
    <div class="p-3 d-sm-none d-md-block" v-if="images.length">
      <div
        v-for="(image, index) of images"
        :key="index"
        @click="activeImageIndex = index"
        class="
          d-inline-block
          image-preview-container
          p-1
          border border-1 border-dark
        "
      >
        <img
          class="preview-image"
          :src="getPreviewPicturePath(index)"
          :alt="title"
        />
      </div>
    </div>
  </div>
</template>>

<script>
export default {
  props: {
    pictures: {
      type: String,
      required: false,
    },
    title: {
      type: String,
      required: false,
    },
  },

  data() {
    return {
      images: JSON.parse(this.pictures),
      activeImageIndex: 0,
    };
  },

  computed: {
    picturePath() {
      return this.images[this.activeImageIndex]
        ? "/storage/img/" + this.images[this.activeImageIndex]
        : "/img/cap.png";
    },
  },

  methods: {
    getPreviewPicturePath(index) {
      return "/storage/img/" + this.images[index];
    },
  },
};
</script>

<style scoped>
.main-image {
  width: auto;
  max-width: 90%;
  height: 400px;
}

.preview-image {
  width: 100%;
}

.image-preview-container {
  width: 72px;
  height: fit-content;
  margin: 5px;
}
.image-preview:hover {
  cursor: pointer;
}
</style>