<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" type="text/css" media="screen" href="./bootstrap/bootstrap.min.css">
    <jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
    <!-- Style -->
	<jsp:include page="/WEB-INF/views/frontend/layout/style.jsp"></jsp:include>
</head>
<body>
    <!-- Header -->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
	
    <!-- Menu nu ngang -->
    <jsp:include page="/WEB-INF/views/frontend/layout/menu_ngang.jsp"></jsp:include>
    <main class="main">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Mobile</th>
                    <th scope="col">Address</th>
                    <th scope="col">Message</th>
                    <th scope="col">Filename</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>${contact.txtName }</td>
                    <td>${contact.txtEmail }</td>
                    <td>${contact.txtMobile }</td>
                    <td>${contact.txtAddress }</td>
                    <td>${contact.txtMessage }</td>
                    <td>${filename }</td>
                </tr>
            </tbody>
        </table>
    </main>

    <!-- footer -->
    <footer>
        <div class="container">
            <div class="content_footer">
                <!-- Company Information  -->
                <div class="company">
                    <div class="title">Thông tin</div>
                    <p>Địa chỉ: Mai Dịch - Cầu Giấy -HN</p>
                    <p>SĐT: 0233489943</p>
                    <p>Email: adasd@gmail.com</p>
                    <p><a href="http//facebook.com">www.facebook.com/dientu</a></p>
                </div>
                <!-- Other options -->
                <div class="menu_footer">
                    <div class="item_menu_footer">
                        <div class="title">Trợ giúp</div>
                        <ul>
                            <li>
                                <a href="">Chính sách đổi trả hàng</a>
                            </li>
                            <li>
                                <a href="">Quy trình xử lý khi phát hiện hành vi kinh doanh vi phạm</a>
                            </li>
                            <li>
                                <a href="">Chính sách giao hàng</a>
                            </li>
                            <li>
                                <a href="">Hotdeal E-voucher</a>
                            </li>
                            <li>
                                <a href="">Cách thức thanh toán</a>
                            </li>
                        </ul>
                    </div>
                    <div class="item_menu_footer">
                        <div class="title">Tuyển dụng</div>
                        <ul>
                            <li>
                                <a href="">HR manager</a>
                            </li><li>
                                <a href="">CEO manager</a>
                            </li>
                        </ul>
                    </div>
                    <div class="item_menu_footer">
                        <div class="title">Địa điểm bán offline</div>
                        <div class="map">
                            <center>
                                <iframe width="256" height="140" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.8421720267424!2d105.77860337365085!3d20.958852390179096!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313452d33cdce76b%3A0x6a31e1498a1c523!2zU8OibiBCw7NuZyBDxrDhu51uZyBRdeG7kWMgMg!5e0!3m2!1svi!2s!4v1701242114262!5m2!1svi!2s" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer_end">
            <center><p>Thiết kế 2024 © HoangHieu</p></center>
        </div>
    </footer>
    
    <jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
</body>
</html>