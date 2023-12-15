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
                  {{ formatted(data.product.price - data.product.price * data.product.sale) }}
                </span>
                <span class=" ms-3 fs-small fw-normal text-primary text-decoration-line-through fst-italic">
                  {{ formatted(data.product.price) }}
                </span>
                <span class="ms-2 fs-small text-black">
                  Giảm giá
                  <span>{{ (data.product.sale * 100).toFixed(0) }}%</span>
                </span>
              </div>

            </div>
          </div>
          <div class="col-12  px-0 px-sm-4 mt-2 ">

            <label for="" class="mb-1">Đánh giá sao:</label>
            <div>
              <a-rate v-model:value="voteStar" class="fs-4" :tooltips="voteText" />
              <span class="ms-3 fw-medium " :style="{ color: voteColor[voteStar - 1] }">
                {{ voteText[voteStar - 1] }}
              </span>

            </div>

          </div>
          <div class="col-12 px-0 px-sm-4 mt-2 ">
            <label for="vote-text-form" class="mb-1">Nhập nội dung đánh giá:</label>
            <a-textarea id="vote-text-form" class="border-primary brr-5 shadow-1-primary mt-1" :value="voteContent"
              @change="handleTextareaChange" style="min-height: 150px;" />
          </div>

          <div class="col-12 px-0 px-sm-4 mt-2 text-center">
            <a-button class="brr-5 mb-3 mb-sm-0 ps-3 pe-3" danger htmlType="submit">
              Gửi đánh giá
            </a-button>

          </div>
        </a-form>
      </div>
    </div>
  </div>
</template>

<script>
import { defineComponent, ref } from 'vue';
import { formattedPrice } from "../../../utils/formatPrice";
import { message } from "ant-design-vue";

import { BASE_URL } from "../../../configs";
import { useAuthStore } from "../../../store/auth";
export default defineComponent({
  data() {
    return {
      maxLength: 300,
      voteContent: '',
      voteStar: 5,
      voteText: ['Rất không hài lòng', 'Không hài lòng', 'Bình thường', 'Hài lòng', 'Rất hài lòng'],
      voteColor: ['#FF0000', '#FF4500', '#fadb14', '#B9EF68', '#008000'],

    };
  },
  props: {
    data: {
      type: Object
    },
    orderId: {
      type: String
    }
  },
  watch: {
    voteStar(newValue) {
      if (newValue < 1) {
        this.voteStar = 1;
      }
    },
  },
  methods: {
    formatted(price) {
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
    async handleVoteSubmit() {
      const data = {
        orderId: this.orderId,
        productId: this.data.product._id,
        content: this.voteContent,
        star: this.voteStar,
        itemId:this.data._id
      }
      const rs = await axios.post(
        `${BASE_URL}/home/order/vote`,
        { data },
        {
          headers: { "x-auth-token": useAuthStore().getToken },
        }
      );

      if (rs.status == 200) {
        message.success({
          content: "Đánh giá thành công!",
          duration: 3,
        });
        this.$emit("handleClickToggleVoteModal");
      }
    }
  }
});
</script>

<style></style>
