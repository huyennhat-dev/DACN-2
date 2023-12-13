<template>
  <a-carousel :autoplay="true" arrows class="banner">
    <template #prevArrow>
      <div class="custom-slick-arrow" style="left: 10px; z-index: 1">
        <left-circle-outlined />
      </div>
    </template>
    <template #nextArrow>
      <div class="custom-slick-arrow" style="right: 10px">
        <right-circle-outlined />
      </div>
    </template>
    <img v-for="img in imgs" class="banner-img" :key="img.id" :src="img.url" />
  </a-carousel>
</template>
<script>
import { LeftCircleOutlined, RightCircleOutlined } from "@ant-design/icons-vue";
import { defineComponent, ref } from "vue";
export default defineComponent({
  components: {
    LeftCircleOutlined,
    RightCircleOutlined,
  },
  setup() {
    const imgs = ref([
      {
        id: 1,
        url: "https://pethouse.com.vn/wp-content/uploads/2022/07/pethouse-and-husky-dog.jpg",
      },
      {
        id: 2,
        url: "https://pethouse.com.vn/wp-content/uploads/2022/07/pethouse-sai-gon2.jpg",
      },
      
    ]);

    return { imgs };
  },
});
</script>
<style>
.banner {
  height: 350px;
}
.banner .banner-img {
  height: 350px;
  object-fit: cover;
}
@media (max-width: 576px) {
  .banner {
    height: auto;
  }
  .banner .banner-img {
    height: 200px !important;
    object-fit: cover;
  }
}
</style>
<style scoped>
.ant-carousel {
  border-radius: 10px;
}
.ant-carousel :deep(.slick-slide) {
  text-align: center;
  overflow: hidden;
  border-radius: 10px;
}

.ant-carousel :deep(.slick-arrow.custom-slick-arrow) {
  width: 25px;
  height: 25px;
  font-size: 25px;
  color: #fff;
  background-color: rgba(0, 0, 0, 0.4);
  border-radius: 50px;
  opacity: 0.6;
  z-index: 1;
}
.ant-carousel :deep(.custom-slick-arrow:before) {
  display: none;
}
.ant-carousel :deep(.custom-slick-arrow:hover) {
  opacity: 0.9;
  transition: all 0.3s;
  cursor: pointer;
}

.ant-carousel :deep(.slick-slider .slick-track),
.ant-carousel :deep(.slick-slider .slick-list) {
  border-radius: 10px;
}

.ant-carousel :deep(.slick-dots-bottom) {
  bottom: -10px;
}
.ant-carousel :deep(.slick-dots-bottom li button) {
  border-radius: 2px;
}
</style>
