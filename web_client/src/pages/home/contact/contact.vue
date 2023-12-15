<!-- Trang Contact.vue -->

<template>
  <div class="contact-container">
    <div class="contact-content">
      <form @submit.prevent="submitForm" class="contact-form">
        <h1>Liên hệ</h1>
        <label for="name">Họ và tên:</label>
        <input type="text" id="name" v-model="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" v-model="email" required>

        <label for="phone">Phone:</label>
        <input type="phone" id="phone" v-model="phone" required>

        <label for="message">Nội dung:</label>
        <textarea id="message" v-model="message" required></textarea>

        <button type="submit">Gửi</button>
      </form>
    </div>
    <div class="contact-map">
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.747040669663!2d108.24970407337172!3d15.974581141968317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421088e365cc75%3A0x6648fdda14970b2c!2zNDcwIMSQxrDhu51uZyBUcuG6p24gxJDhuqFpIE5naMSpYSwgSG_DoCBI4bqjaSwgTmfFqSBIw6BuaCBTxqFuLCDEkMOgIE7hurVuZyA1NTAwMDAsIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1702618527626!5m2!1sen!2s" width="600" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      name: '',
      email: '',
      phone: '',
      message: ''
    };
  },
  methods: {
    submitForm() {
      console.log('Đã gửi dữ liệu:', this.name, this.email, this.phone, this.message);
    }
  }
};
</script>

<style scoped>
.contact-container {
  display: flex;
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  flex-wrap: wrap;
}

.contact-content {
  width: 100%;
  padding-right: 20px;
  text-align: left;
  border-radius: 10px; /* Thêm border-radius để bo góc */
}

.contact-form {
  display: grid;
  gap: 10px;
}

.contact-map {
  width: 100%;
  margin-top: 20px;
  height: 400px;
}
label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
}

input, textarea {
  width: 100%;
  padding: 8px;
  box-sizing: border-box;
}

button {
  background-color: #00CCFF;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

button:hover {
  background-color: #0099CC;
}

iframe {
  width: 100%;
  height: 100%;
  border-radius: 10px; /* Thêm border-radius để bo góc */
}

textarea {
  height: 98px;
}

@media (min-width: 600px) {
    .contact-content {
        width: 50%;
    }

    .contact-map {
        width: 50%;
        height: 500px;
    }
}

</style>




        