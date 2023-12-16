<template>
  <div class="container animated fadeIn">
    <div class="row">
      <h1 class="header-title">{{ pageTitle }}</h1>
      <hr style="margin-bottom: 10px;">
      <div class="row" id="parent" >
        <div class="col-sm-5" style="float: right">
          <iframe width="100%" height="320px;" frameborder="0" style="border:0" :src="googleMapsUrl" allowfullscreen></iframe>
        </div>
        <div class="space-betweeen">
        </div>
        <div class="col-sm-5 form">
          <form @submit.prevent="submitForm" class="contact-form">
            <div class="form-group">
              <input v-model="name" type="text" class="form-control" placeholder="Họ và Tên" required autofocus>
            </div>
            <div class="form-group form_left">
              <input v-model="email" type="email" class="form-control" placeholder="Email" required>
            </div>
            <div class="form-group">
              <input v-model="phone" type="text" class="form-control" @keypress="isNumber" maxlength="10" placeholder="Số điện thoại" required>
            </div>
            <div class="form-group" style="margin-bottom: 0px;">
              <textarea v-model="message" class="form-control textarea-contact" rows="5" placeholder="Nội dung" required></textarea>
              <br>
              <button type="submit" class="btn btn-default btn-send">
                <span class="glyphicon glyphicon-send"></span> Send
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="container second-portion">
      <div class="row">
        <!-- Boxes de Acoes -->
        <div v-for="(box, index) in contactBoxes" :key="index" class="col-xs-12 col-sm-6 col-lg-4">
          <div class="box">
            <div class="icon">
              <div class="image">
                <i :class="box.iconClass" aria-hidden="true"></i>
              </div>
              <div class="info">
                <h3 class="title">{{ box.title }}</h3>
                <p v-html="box.content"></p>
              </div>
            </div>
            <div class="space"></div>
          </div>
        </div>
        <!-- /Boxes de Acoes -->
      </div>
    </div>
  </div>
</template>

<!-- ... The rest of the script and style sections remain unchanged ... -->


<script>
export default {
  data() {
    return {
      pageTitle: 'Liên hệ với chúng tôi',
      googleMapsUrl: 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3835.747040669663!2d108.24970407337172!3d15.974581141968317!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421088e365cc75%3A0x6648fdda14970b2c!2zNDcwIMSQxrDhu51uZyBUcuG6p24gxJDhuqFpIE5naMSpYSwgSG_DoCBI4bqjaSwgTmfFqSBIw6BuaCBTxqFuLCDEkMOgIE7hurVuZyA1NTAwMDAsIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1702708797691!5m2!1sen!2s',
      name: '',
      email: '',
      phone: '',
      message: '',
      contactBoxes: [
        {
          iconClass: 'fa fa-envelope',
          title: 'MAIL & WEBSITE',
          content: '<i class="fa fa-envelope" aria-hidden="true"></i> &nbsp gondhiyahardik6610@gmail.com<br><br><i class="fa fa-globe" aria-hidden="true"></i> &nbsp www.hardikgondhiya.com'
        },
        {
          iconClass: 'fa fa-mobile',
          title: 'LIÊN HỆ',
          content: '<i class="fa fa-mobile" aria-hidden="true"></i> &nbsp (+84)764835273<br><br><i class="fa fa-mobile" aria-hidden="true"></i> &nbsp (+84)767485773'
        },
        {
          iconClass: 'fa fa-map-marker',
          title: 'ĐỊA CHỈ',
          content: '<i class="fa fa-map-marker" aria-hidden="true"></i> &nbsp 470 Trần Đại Nghĩa, phường Hòa Quý, quận Ngũ Hành Sơn, TP. Đà Nẵng'
        }
      ]
    };
  },
  methods: {
    submitForm() {
      // Handle form submission logic here
      console.log('Form submitted!');
    },
    isNumber(event) {
      const charCode = event.charCode;
      return charCode >= 48 && charCode <= 57;
    }
  }
};
</script>

<style scoped>
/* Your CSS styles go here */
</style>

<style scoped>
  /* Contact start */

  /* Import statements first */
  @import url("//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css");
   @import url("//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css");
  @import url("//code.jquery.com/jquery-1.11.1.min.js");
  @import "//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css";
  @import "http://fonts.googleapis.com/css?family=Roboto:400,500";

  /* Other styles come after import statements */
  .header-title {
    padding-top: 15px;
    text-align: center;
    color: #5db0cc;
    font-size: 25px;
    font-family: "Robot", sans-serif !important;
    margin-bottom: 0px;
  }

  #tip {
    display: none;
  }

  .fadeIn {
    animation-duration: 3s;
  }

  .form-control {
    border-radius: 0px;
    border: 1px solid #EDEDED;
  }

  .form-control:focus {
    border: 1px solid #00bfff;
  }

  .textarea-contact {
    resize: none;
  }

  .btn-send {
    border-radius: 0px;
    border: 1px solid #5db0cc;
    background: #5db0cc;
    color: #fff;
    border-radius: 8px;
  }

  .btn-send:hover {
    border: 1px solid #5db0cc;
    background: #fff;
    color: #5db0cc;
    transition: background 0.5s;
  }

  .second-portion {
    margin-top: 15px;
  }

  @import "//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css";
  @import "http://fonts.googleapis.com/css?family=Roboto:400,500";

  .box > .icon {
    text-align: center;
    position: relative;
  }

  .box > .icon > .image {
    position: relative;
    z-index: 2;
    margin: auto;
    width: 70px;
    height: 70px;
    border: 5px solid white;
    line-height: 70px;
    border-radius: 50%;
    background: #5db0cc;
    vertical-align: middle;
  }

  .box > .icon:hover > .image {
    background: #333;
  }

  .box > .icon > .image > i {
    font-size: 36px !important;
    color: #fff !important;
  }

  .box > .icon:hover > .image > i {
    color: white !important;
  }

  .box > .icon > .info {
    margin-top: -32px;
    background: rgba(0, 0, 0, 0.04);
    border: 1px solid #e0e0e0;
    padding: 15px 0 10px 0;
    min-height: 163px;
  }

  .box > .icon:hover > .info {
    background: rgba(0, 0, 0, 0.04);
    border-color: #e0e0e0;
    color: white;
  }

  .box > .icon > .info > h3.title {
    font-family: "Robot", sans-serif !important;
    font-size: 16px;
    color: #222;
    font-weight: 700;
  }

  .box > .icon > .info > p {
    font-family: "Robot", sans-serif !important;
    font-size: 13px;
    color: #666;
    line-height: 1.5em;
    margin: 20px;
  }

  .box > .icon:hover > .info > h3.title,
  .box > .icon:hover > .info > p,
  .box > .icon:hover > .info > .more > a {
    color: #222;
  }

  .box > .icon > .info > .more a {
    font-family: "Robot", sans-serif !important;
    font-size: 12px;
    color: #222;
    line-height: 12px;
    text-transform: uppercase;
    text-decoration: none;
  }

  .box > .icon:hover > .info > .more > a {
    color: #fff;
    padding: 6px 8px;
    background-color: #63B76C;
  }

  .box .space {
    height: 30px;
  }

  #parent{
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0 40px;
  }

  .space-betweeen{
    width: 60px;
  }

  .form input, .form textarea{
    border: 1px solid #e6e6e6;
    border-radius: 8px;
  }

   @media only screen and (max-width: 1200px) {
      .space-betweeen{
        width: 20px;
      }
   }

    @media only screen and (max-width: 768px) {
    .contact-form {
      margin-top: 25px;
    }

    .btn-send {
      width: 100%;
      padding: 10px;
    }

    .second-portion {
      margin-top: 25px;
    }
  }

  /* Contact end */
</style>
