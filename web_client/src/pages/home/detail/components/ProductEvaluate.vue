<template>
  <div class="product-evaluate px-3 mt-3 mb-4 px-sm-4 brr-10">
    <div class="px-2 pt-3">
      <span class="fs-5 fw-bold text-back">Đánh giá của khác hàng </span>
    </div>
    <div class="product-evaluate-content pb-4 px-2">
      <div class="row">
        <div v-for="rate of data" :key="rate._id" class="col-12 px-2 p-sm-4 d-flex vote-item">

          <div class="user-photo">
            <img :src="rate.user.photo" alt="" width="50" height="50" class="rounded-3">
          </div>
          <div class="w-100 px-3">
            <div>
              <span class="fs-6 fw-bold"> {{ rate.user.name }}</span>
              <CheckCircleFilled class="ms-2 text-success" />
              <span class="fw-semibold  text-success" style="font-size: 12px;"> Đã mua hàng</span>
            </div>
            <div>
              <a-rate :value="rate.star" disabled class="fs-small me-2" />
              <span class="fw-medium" :style="{ color: voteColor[rate.star - 1] }" style="font-size: 12px;">
                {{ voteText[rate.star - 1] }}
              </span>
            </div>
            <div class="mt-1">{{ rate.content.charAt(0).toUpperCase() + rate.content.slice(1) }}</div>
            <div class="d-flex align-items-center justify-content-between">
              <div class="d-flex align-items-center">
                <HeartFilled class="fs-6 text-primary" style="cursor: pointer;" />
                <span class="fs-small ms-1 fw-bold text-primary">{{ getRandomNumber(1, 15) }}</span>
              </div>
              <div class="mt-1 text-black-50 fs-small fw-medium">Đánh giá vào {{ formatTime(rate.createdAt) }}
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</template>

<script>
import { defineComponent } from 'vue';
import { CheckCircleFilled, HeartFilled, HeartOutlined } from "@ant-design/icons-vue";

export default defineComponent({
  components: {
    CheckCircleFilled,
    HeartFilled,
    HeartOutlined
  },
  props: {
    data: Array
  },
  data() {
    return {
      voteText: ['Rất không hài lòng', 'Không hài lòng', 'Bình thường', 'Hài lòng', 'Rất hài lòng'],
      voteColor: ['#FF0000', '#FF4500', '#fadb14', '#B9EF68', '#008000'],
    }
  },
  methods: {
    getRandomNumber(min, max) {
      return Math.floor(Math.random() * (max - min + 1)) + min;
    },
    formatTime(time) {
      const mongoTime = new Date(time);
      const gmtPlus7Time = new Date(mongoTime.getTime());

      const formattedTime = `
      ${gmtPlus7Time.getDate()}-${gmtPlus7Time.getMonth() + 1
        }-${gmtPlus7Time.getFullYear()}`;
      return formattedTime;
    },
  }

});
</script>

<style>
.product-evaluate {
  background-color: #fff;
}

.product-evaluate .vote-item:first-child {
  margin-top: 0;
  border-top: none;
}

.product-evaluate .vote-item {
  margin-top: 10px;
  border-top: 1px solid #eee;
}
</style>
