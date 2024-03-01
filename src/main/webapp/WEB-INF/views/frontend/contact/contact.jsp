<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${title}</title>
<link rel="stylesheet" type="text/css" media="screen"
	href="${classpath}/frontend/bootstrap/bootstrap.min.css">
<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
<!-- Style -->
<jsp:include page="/WEB-INF/views/frontend/layout/style.jsp"></jsp:include>
</head>
<body>
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

	<!-- Menu nu ngang -->
	<jsp:include page="/WEB-INF/views/frontend/layout/menu_ngang.jsp"></jsp:include>
	<div class="jumbotron text-center">
		<!-- cho vào box có size lớn -->
		<h1 style="color: crimson;">𝕄𝕆𝔹𝕀𝕃𝔼 𝕎𝕆ℝ𝕃𝔻</h1>
		<p>❤Uy tín chất lượng - Kết nối yêu thương❤</p>
	</div>

	<main class="main">
		<div class="main__contact">
			<div class="container">
				<div class="row">
					<div class="col-12 col-lg-6">
						<div class="contact__title">
							<h2 class="title">Liên lạc</h2>
						</div>
						<div class="contact__form">
							<div class="notice" style="margin-left: 5%">
								<p class="text-red-900 mb-2" style="color: red;">${message }</p>
							</div>
							<form class="form" action="/contact-send" method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="contact__form-input">
											<input type="text" class="form-input"
												placeholder="Your name..." id="txtName" name="txtName"
												value="${loginedUser.name }">
										</div>
									</div>
									<div class="col-md-6">
										<div class="contact__form-input">
											<input type="email" class="form-input" placeholder="Email..."
												id="txtEmail" name="txtEmail" value="${loginedUser.email }">
										</div>
									</div>
									<div class="col-md-6">
										<div class="contact__form-input">
											<input type="text" class="form-input"
												placeholder="Your mobile..." id="txtMobile" name="txtMobile"
												value="${loginedUser.mobile }">
										</div>
									</div>
									<div class="col-md-6">
										<div class="contact__form-input">
											<input type="text" class="form-input"
												placeholder="Your address..." id="txtAddress"
												name="txtAddress" value="${loginedUser.address }">
										</div>
									</div>
									<div class="col-12">
										<div class="contact__form-input">
											<textarea cols="30" rows="5" class="form__textarea"
												id="txtMessage" name="txtMessage"
												placeholder="Leave your feedback..."></textarea>
										</div>
									</div>
									<div class="col-12">
										<div class="contact__btn">
											<!-- <a href="#">Send</a> -->
											<button class="btn btn-primary">Send</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="col-12 col-lg-6">
						<div class="contact__title">
							<h2 class="title">Liên hệ với chúng tôi</h2>
						</div>
						<p class="contact__description">Lorem ipsum dolor sit amet
							consectetur adipisicing elit. Voluptate facere aliquid quibusdam
							provident laudantium veniam iste magni doloribus ipsam porro
							similique, quisquam temporibus, quod ipsa obcaecati tempora.
							Doloribus, corporis impedit! Lorem, ipsum dolor sit amet
							consectetur adipisicing elit. Id ducimus sed voluptates sequi
							adipisci aspernatur, veniam libero dolor harum eaque consectetur
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
	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

	<script type="text/javascript">
		function _contactSend() {
			//javascript object
			let data = {
				txtName : jQuery("#txtName").val(),
				txtEmail : jQuery("#txtEmail").val(), //Get by Id
				txtMobile : jQuery("#txtMobile").val(),
				txtAddress : jQuery("#txtAddress").val(),
				txtMessage : jQuery("#txtMessage").val(),
			};

			//$ === jQuery
			jQuery.ajax({
				url : "/contact-send",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json

				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					//$("#placeOrderSuccess").html(jsonResult.message);
				},

				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>
</body>
</html>