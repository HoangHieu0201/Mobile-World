<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>	

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title }</title>
    <link rel="stylesheet" type="text/css" media="screen" href="${classpath}/frontend/bootstrap/bootstrap.min.css">
	<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
	
	<!-- Style -->
	<jsp:include page="/WEB-INF/views/frontend/layout/style.jsp"></jsp:include>
</head>
<body>
    <!-- Header -->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
	
    <!-- Menu nu ngang -->
    <jsp:include page="/WEB-INF/views/frontend/layout/menu_ngang.jsp"></jsp:include>
    
    <div class="jumbotron text-center"> <!-- cho vào box có size lớn -->
        <h1 style="color: crimson;">𝕄𝕆𝔹𝕀𝕃𝔼 𝕎𝕆ℝ𝕃𝔻</h1>
        <p>❤Uy tín chất lượng - Kết nối yêu thương❤</p>
        <form class="form-inline justify-content-center">
            <input type="text" class="form-control" size="50" placeholder="Nhập sản phẩm cần tìm">
            <button type="button" class="btn btn-danger">Tìm</button>
        </form>
    </div>

    <!-- Slider -->
    <!-- <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="d-block w-100" src="${classpath}/frontend/images/apple/Iphone 13 promax.jpg" alt="First slide">
            <div class="carousel-caption d-none d-md-block caption">
                <h5>Nhanh tay mua ngay</h5>
                <p>Đặt hàng ngay hôm nay để có mức giá ưu đãi</p>
              </div>
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="${classpath}/frontend/images/apple/Iphone 15.jpg" alt="Second slide">
            <div class="carousel-caption d-none d-md-block caption">
                <h5>Nhanh tay mua ngay</h5>
                <p>Đặt hàng ngay hôm nay để có mức giá ưu đãi</p>
            </div>
          </div>
          <div class="carousel-item">
            <img class="d-block w-100" src="${classpath}/frontend/images/apple/Iphone 12.jpg" alt="Third slide">
            <div class="carousel-caption d-none d-md-block caption">
                <h5>Nhanh tay mua ngay</h5>
                <p>Đặt hàng ngay hôm nay để có mức giá ưu đãi</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div> -->

    <!-- Gioi thiệu -->
    <div id="about" class="container-fluid">
        <div class="row">
            <div class="col-sm-8">
                <h2>Giới thiệu Mobileworld.vn</h2> <br>
                <h4>Mobileworld.vn - Bên cạnh những sản phẩm chất lượng, uy tín - Hệ thống thế giới di động của chúng tôi 
                    còn là đơn vị vận chuyển sản phẩm, ship hàng tận nơi cho khách hàng. Hướng đến một cửa hàng đa chức năng.
                </h4> <br>
                <p>Chúng tôi cam kết những sản phẩm chất lượng cao nhất cho quý khách hàng đến với cửa 
                    hàng của chúng tôi. Ngoài ra, chính sách bảo hành sẽ khiến các bạn cảm thấy yên tâm hơn 
                    khi đặt niềm tin vào của hàng của chúng tôi.
                </p> <br>
                <button class="btn btn-default btn-lg">Liên hệ với chúng tôi</button>
            </div>
            <div class="col-sm-4 align-items-center">
                <img class="img-fluid max-width: 100% height: 100%" src="${classpath}/frontend/images/banner1.jpg"  >
            </div>
        </div>
    </div>

    <!-- Giá tị -->
    <div class="container-fluid bg-grey">
        <div class="row">
            <div class="col-sm-4">
                <img class="img-fluid max-width: 100% height: 100%" src="${classpath}/frontend/images/banner1.jpg"  >
            </div>
            <div class="col-sm-8">
                <h2>Giá trị của Mobileworld.vn mang lại</h2> <br>
                <h4><strong>Sứ mệnh : </strong>Đơn vị tiên phong tại Việt Nam cam kết hàng chính hãng chất lượng cao. Đồng thời 
                cũng chịu trách nhiệm trực tiếp việc ship sản phẩm đến tận tay khách hàng.</h4>
                <br>
                <p><strong>Tầm nhìn : </strong>Bên cạnh hệ thống bán hàng trực tuyến này, chúng tôi còn mở rộng sang các mảng bán hàng offline 
                giới thiệu quảng bá qua các tờ rơi, hay mở rộng thị trường sang nước ngoài bằng cách tuyển các nhân viên bán hàng 
                có trình độ ngoại ngữ khá, có thể giao tiếp ổn.</p>
            </div>
        </div>
    </div>

    <!-- Dịch vụ -->
    <div id="service" class="container-fluid text-center">
        <h2>Dịch vụ</h2>
        <h4>Các dịch vụ của chúng tôi bao gồm </h4>
        <br>
        <div class="row">
            <div class="col-sm-4">
                <div class="card">
                    <a href="">
                        <img class="card-img-top" src="${classpath}/frontend/images/apple/Iphone 12.jpg" alt="">
                    </a>
                    <div class="card-body">
                        <h2 class="card-title">
                            <a href="">Dịch vụ mua sắm</a>
                        </h2>
                        <p class="card-text">Quy trình áp dụng đối với các đơn vị trực thuộc MobileWorld khi thực hiện công việc mua sắm hàng hóa và các dịch vụ phi tư vấn từ các nguồn vốn đầu tư.</p>
                        <button class="btn btn-primary btn-block">Liên hệ</button>
                    </div>
                </div>
            </div>
        
            <div class="col-sm-4">
                <div class="card">
                    <a href="">
                        <img class="card-img-top" src="${classpath}/frontend/images/apple/Iphone 13 promax.jpg" alt="">
                    </a>
                    <div class="card-body">
                        <h2 class="card-title">
                            <a href="">Dịch vụ vận chuyển</a>
                        </h2>
                        <p class="card-text">Quy trình áp dụng đối với các đơn vị trực thuộc MobileWorld khi thực hiện công việc mua sắm hàng hóa và các dịch vụ phi tư vấn từ các nguồn vốn đầu tư.</p>
                        <button class="btn btn-primary btn-block">Liên hệ</button>
                    </div>
                </div>
            </div>
      
            <div class="col-sm-4">
                <div class="card">
                    <a href="">
                        <img class="card-img-top" src="${classpath}/frontend/images/apple/Iphone 15 plus.jpg" alt="">
                    </a>
                    <div class="card-body">
                        <h2 class="card-title">
                            <a href="">Dịch vụ khác</a>
                        </h2>
                        <p class="card-text">Quy trình áp dụng đối với các đơn vị trực thuộc MobileWorld khi thực hiện công việc mua sắm hàng hóa và các dịch vụ phi tư vấn từ các nguồn vốn đầu tư.</p>
                        <button class="btn btn-primary btn-block">Liên hệ</button>
                    </div>
                </div>
            </div>

        </div>
    </div>

 <!-- Footer -->
    <jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
    
    <jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
</body>
</html>