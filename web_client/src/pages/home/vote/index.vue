<template>
  <div>
    <div class="container">
      <div class="row">
        <a-form @submit.prevent="handleVoteSubmit()">
          <div class="col-12 px-sm-4 px-0 py-1 d-flex position-relative align-items-center">
            <div class="item-image brr-2 border" style="padding: 1px">
              <img :src="data.product.photos[0]" class="brr-2" width="70" height="70" style="object-fit: cover;" />
            </div>
            <div class="ms-2 ">
              <div>
                <span class="fs-5 fw-bold text-black">
                  {{ data.product.name }}
                </span>
              </div>
              <div class="d-none d-sm-block">
                <span class="fs-6 fw-bold text-primary">
                  {{ fomated(data.product.price - data.product.price * data.product.sale) }}
                </span>
                <span class=" ms-3 fs-small fw-normal text-primary text-decoration-line-through fst-italic">
                  {{ fomated(data.product.price) }}
                </span>
                <span class="ms-2 fs-small text-black">
                  Giảm giá
                  <span>{{ (data.product.sale * 100).toFixed(0) }}%</span>
                </span>
              </div>

            </div>
          </div>
          <div class="col-12 px-0 px-sm-4 mt-2 ">
            <label for="vote-text-form" class="mb-1">Nhập nội dung đánh giá:</label>
            <a-textarea id="vote-text-form" class="border-primary brr-5 shadow-1-primary" :value="voteContent"
              @change="handleTextareaChange" style="min-height: 150px;" />
          </div>
          <div class="col-12 px-0 px-sm-4 mt-2 d-flex align-items-end justify-content-between">
            <div>
              <label for="vote-text-form" class="mb-1">Đánh giá sao:</label>
              <a-rate v-model:value="voteStar" class="ms-2" />
            </div>
            <div>
              <a-button class="brr-5  mb-3 mb-sm-0 ps-3 pe-3" danger htmlType="submit">
                Đánh giá
              </a-button>
            </div>
          </div>
        </a-form>
      </div>
    </div>
  </div>
</template>

<script>
import { defineComponent } from 'vue';
import { formattedPrice } from "../../../utils/formatPrice";

export default defineComponent({
  data() {
    return {
      maxLength: 300,
      voteContent: '',
      voteStar: 5,
    };
  },
  props: {
    data: {
      type: Object
    },
  },
  methods: {
    fomated(price) {
      if (price) return formattedPrice(price);
    },
    handleTextareaChange(e) {
      const inputValue = e.target.value;

      if (inputValue.length <= this.maxLength) {
        this.voteContent = inputValue;
      } else {
        this.voteContent = inputValue.slice(0, this.maxLength);
      }
    },
    handleVoteSubmit() {
      const data = {
        productId: this.data.product._id,
        content: this.voteContent,
        star: this.voteStar
      }
      console.log(data)
    }
  }
});
</script>

<style></style>
