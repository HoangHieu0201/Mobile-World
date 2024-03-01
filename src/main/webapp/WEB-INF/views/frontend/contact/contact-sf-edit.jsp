<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
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
    <main class="main">
        <div class="main__contact">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-lg-6">
                        <div class="contact__title">
                            <h2 class="title">Liên lạc</h2>
                        </div>
                        <div class="contact__form">
                            <sf:form class="form" action="/contact-sf-edit-save" method="post" modelAttribute="contact">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="contact__form-input">
                                            <sf:input path="name" type="text" class="form-input" 
                                            placeholder="Your name..."
                                                id="txtName" name="txtName" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="contact__form-input">
                                            <sf:input path="email" type="email" class="form-input" placeholder="Email..."
                                                    id="txtEmail" name="txtEmail" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="contact__form-input">
                                            <sf:input path="mobile" type="text" class="form-input" placeholder="Your mobile..."
                                                id="txtMobile" name="txtMobile" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="contact__form-input">
                                            <sf:input path="address" type="text" class="form-input" placeholder="Your address..."
                                                id="txtAddress" name="txtAddress" />
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="contact__form-input">
                                            <sf:textarea path="message" cols="30" rows="5" class="form__textarea" id="txtMessage" name="txtMessage"
                                                placeholder="Message"></sf:textarea>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="contact__btn">
                                            <!-- <a href="#">Send</a> -->
                                            <!-- <button type="submit" class="btn btn-primary">Send</button> -->
                                            <button type="button" class="btn btn-primary" onclick="_notification()">Save edit</button>
                                        </div>
                                    </div>
                                </div>
                            </sf:form>
                        </div>
                    </div>
                    <div class="col-12 col-lg-6">
                        <div class="contact__title">
                            <h2 class="title">Liên hệ với chúng tôi</h2>
                        </div>
                        <p class="contact__description">Lorem ipsum dolor sit amet consectetur adipisicing elit.
                            Voluptate facere aliquid quibusdam provident laudantium veniam iste magni doloribus
                            ipsam porro similique, quisquam temporibus, quod ipsa obcaecati tempora. Doloribus,
                            corporis impedit! Lorem, ipsum dolor sit amet consectetur adipisicing elit. Id ducimus
                            sed voluptates sequi adipisci aspernatur, veniam libero dolor harum eaque consectetur
                            officia iusto aut officiis quas est animi nam autem.</p>
                        <ul class="contact__address">
                            <li><i class='bx bx-phone'></i> 012345678</li>
                            <li><i class='bx bx-envelope'></i> mail@gmail.com</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
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
    
    <script type="text/javascript">
		function _notification() {
			//javascript object
			let data = {
				
				name : jQuery("#txtName").val(),
				email : jQuery("#txtEmail").val(), //Get by Id
				mobile : jQuery("#txtMobile").val(),
				address : jQuery("#txtAddress").val(),
				message : jQuery("#txtMessage").val(),
				
			};
			
			//$ === jQuery
			jQuery.ajax({
				url : "/contact-edit-save",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					//$("#notification").html(jsonResult.message);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>
</body>
</html>