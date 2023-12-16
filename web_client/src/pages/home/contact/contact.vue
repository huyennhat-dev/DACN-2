<template>
  <div class="main container" style="">
    <div class="row">
      <div class="col-12">
        <div class="py-3 pb-4">
          <div class="bg-white brr-10 py-3 px-1 px-sm-3 brr-10">
            <h1 class="w-100 text-center fs-4 fw-medium">{{ pageTitle }}</h1>

            <div class="w-100 d-flex justify-content-center">
              <div class="col-sm-10 col-12 d-block d-sm-flex">
                <div class="col-sm-6 col-12 p-4">
                  <form @submit.prevent="handleSubmitForm" class="h-100">
                    <div class="row">
                      <div class="col-12 mb-1 pe-sm-5 p-0">
                        <label for="name-input"> Họ và tên: </label>
                        <a-input id="name-input" placeholder="Nhập họ và tên" class="brr-5 mt-1"
                          v-model:value="formData.name" allowClear />
                      </div>

                      <div class="col-12 mb-1 pe-sm-5 p-0">
                        <label for="email-input"> Email: </label>
                        <a-input id="email-input" placeholder="Nhập Email" class="brr-5 mt-1"
                          v-model:value="formData.email" allowClear />
                      </div>
                      <div class="col-12 mb-1 pe-sm-5 p-0">
                        <label for="phone-input"> Số điện thoại: </label>
                        <a-input id="phone-input" inputmode="phone-input" placeholder="Nhập số điện thoại"
                          class="brr-5 mt-1" v-model:value="formData.phone" allowClear />
                      </div>
                      <div class="col-12 mb-1 pe-sm-5 p-0">
                        <label for="content-input"> Nội dung: </label>
                        <a-textarea id="content-input" placeholder="Nhập nội dung" class="brr-5"
                          v-model:value="formData.content" allowClear />
                      </div>

                      <div class="col-12 mt-1 pe-sm-5 p-0 text-center">
                        <a-button htmlType="submit" type="primary" ghost class="brr-5 px-4">
                          <span class="fw-medium"> Gửi </span>
                          <SendOutlined />
                        </a-button>
                      </div>
                    </div>
                  </form>
                </div>

                <div class="col-sm-6 col-12 p-4">
                  <div class="brr-5 overflow-hidden shadow-full">
                    <iframe width="100%" class="brr-5 border-0" height="320px;" :src="googleMapsUrl" allowfullscreen>
                    </iframe>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div v-for="(box, index) in contactBoxes" :key="index" class="col-12 col-sm-4 px-3">
                <div class="px-2  position-relative" style="height: 155px;">
                  <div class=" row justify-content-center text-center ">
                    <div class="p-1 bg-white rounded-circle position-absolute z-1" style="width: 55px; height: 55px;">
                      <div class=" bg-info w-100  h-100 rounded-circle d-flex align-items-center justify-content-center">
                        <font-awesome-icon :icon="['fa', box.iconClass]" class="text-white fs-4" />
                      </div>
                    </div>
                    <div class="bg-body-secondary brr-5  w-100 position-absolute z-0 pb-3" style="top: 25px;">
                      <h3 class="title mt-4 pt-2 fw-bold">{{ box.title }}</h3>
                      <div v-for="(content, index) in box.content" :key="index" class="px-2">
                        <font-awesome-icon :icon="['fa', content.icon]" class="text-black-50 fs-small me-2" />
                        <span class="fs-small fw-medium text-black">{{ content.text }}</span>
                      </div>
                    </div>
                  </div>
                  <div class="space"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>


<script>
import { SendOutlined } from "@ant-design/icons-vue";
export default {
  components: {
    SendOutlined,
  },
  data() {
    return {
      pageTitle: "Liên hệ với chúng tôi",
      googleMapsUrl:
        "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.747040669663!2d108.24970407337172!3d15.974581141968317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421088e365cc75%3A0x6648fdda14970b2c!2zNDcwIMSQxrDhu51uZyBUcuG6p24gxJDhuqFpIE5naMSpYSwgSG_DoCBI4bqjaSwgTmfFqSBIw6BuaCBTxqFuLCDEkMOgIE7hurVuZyA1NTAwMDAsIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1702708797691!5m2!1sen!2s",
      formData: {
        name: "",
        email: "",
        phone: "",
        content: "",
      },
      contactBoxes: [
        {
          iconClass: "fa-envelope",
          title: "MAIL & WEBSITE",
          content:
            [{
              icon: 'fa-envelope',
              text: 'shoplovepet@gmail.com'
            },
            {
              icon: 'fa-globe',
              text: 'www.shoplovepet.com'
            }]
        },
        {
          iconClass: "fa-mobile",
          title: "LIÊN HỆ",
          content: [{
            icon: 'fa-mobile',
            text: '(+84) 764835273'
          },
          {
            icon: 'fa-mobile',
            text: '(+84) 764835273'
          }]
        },
        {
          iconClass: "fa-map-marker",
          title: "ĐỊA CHỈ",
          content: [{
            icon: 'fa-map-marker',
            text: '470 Trần Đại Nghĩa, phường Hòa Quý, quận Ngũ Hành Sơn, TP. Đà Nẵng'
          },]
        },
      ],
    };
  },
  methods: {
    submitForm() {
      console.log("Form submitted!");
    },
    isNumber(event) {
      const charCode = event.charCode;
      return charCode >= 48 && charCode <= 57;
    },
  },
};
</script>

<style></style>
