<template>
    <!-- Footer -->
  <MDBFooter :text="['center', 'lg-start', 'muted']">
    <!-- Section: Social media -->
    <section class="
        d-flex
        justify-content-center justify-content-lg-between
        p-4
        border-bottom
      " id="footer">
      <!-- Left -->
      <!-- Left -->
      <!-- Right -->
      <!-- Right -->
    </section>
    <!-- Section: Social media -->
    <!-- Section: Links  -->
    <section class=""  id="mtc">
      <MDBContainer class="text-center text-md-start mt-5">
        <!-- Grid row -->
        <MDBRow class="mt-3">
          <!-- Grid column -->
          <MDBCol md="3" lg="4" xl="3" class="mx-auto mb-4">
            <!-- Content -->
            <h6 class="text-uppercase fw-bold mb-4">
              Shop Pet
            </h6>
            <p>
              Tìm bạn đồng hành đáng yêu cho gia đình của bạn! 
              Dòng thú cưng của chúng tôi mang lại niềm vui, tình cảm và sự trung thành. 
              Luôn chia sẻ tình yêu và kỷ niệm không ngừng, sẵn sàng tạo nên những khoảnh khắc đáng nhớ trong cuộc sống của bạn.
            </p>
          </MDBCol>
          <!-- Grid column -->
          <!-- Grid column -->
          <MDBCol md="2" lg="2" xl="2" class="mx-auto mb-4">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold mb-4">Sản phẩm</h6>
            <p>
              <a href="#!" class="text-reset">Chó Poodle</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Mèo Anh Lông Ngắn</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Chó Chihuahua</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Mèo Maine Coon</a>
            </p>
          </MDBCol>
          <!-- Grid column -->
          <!-- Grid column -->
          <MDBCol md="3" lg="2" xl="2" class="mx-auto mb-4">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold mb-4">Hữu ích</h6>
            <p>
              <a href="#!" class="text-reset">Cài đặt</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Thông tin</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Đặt hàng</a>
            </p>
            <p>
              <a href="#!" class="text-reset">Hỗ trợ</a>
            </p>
          </MDBCol>
          <!-- Grid column -->
          <!-- Grid column -->
          <MDBCol md="4" lg="3" xl="3" class="mx-auto mb-md-0 mb-4">
            <!-- Links -->
            <h6 class="text-uppercase fw-bold mb-4">Liên hệ</h6>
            <p>
              <i class="fas fa-home me-3"></i> Da Nang, VN 
            </p>
            <p>
              <i class="fas fa-envelope me-3"></i>
              Shoplovepet@gmail.com
            </p>
            <p>
              <MDBIcon icon="phone" class="me-3" /> + 84 987456876
            </p>
            <p>
              <MDBIcon icon="print" class="me-3" /> + 84 678654765
            </p>
          </MDBCol>
          <!-- Grid column -->
        </MDBRow>
        <!-- Grid row -->
      </MDBContainer>
    </section>
    <!-- Section: Links  -->
    <!-- Copyright -->
    <!-- <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05)"> -->
      <!-- © 2023 Copyright -->
      <!-- <a class="text-reset fw-bold" href="https://www.facebook.com/huyennhat.dev">Facebook Me Truyen Chu</a> -->
    <!-- </div> -->
    <!-- Copyright -->
  </MDBFooter>
  <!-- Footer -->
</template>
  <script>
    import { MDBFooter, MDBIcon, MDBRow, MDBCol, MDBContainer } from "mdb-vue-ui-kit";
  
    export default {
      components: {
        MDBFooter,
        MDBIcon,
        MDBRow,
        MDBCol,
        MDBContainer
      }
    }
  </script>

  <style>
  #footer{
    margin-top: 60px;
  }

  .text-uppercase{
    text-transform: uppercase;
    font-size: 18px;
    font-weight: 600;
  }

</style>