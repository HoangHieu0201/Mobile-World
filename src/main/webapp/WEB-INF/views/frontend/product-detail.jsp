<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    
    <!-- nội dung giữa trang-->
    <main>
        <div class="container">
            <p class="mb-2 mt-1 pb-3">
                <a href="Index.html">Trang chủ</a> 
                > <a href="Product.html">Cửa hàng</a> 
                > <a href="product_info.html">Sản phẩm</a>
            </p>
            <div class="row">
                <!-- ảnh sp -->
                <div class="col-lg-5">
                	<div class="images">
	                    <div class="main_picture">
	                        <img src="${classpath }/FileUploads/${product.avatar }" class="img-fluid" style="height: 110%;" alt="Responsive image">
	                    </div>
	                    <div class="support_picture">
	                        <div class="row">
								<c:forEach items="${productImages }" var="productImage">
									<div class="col-lg-3 mt-3 small_img">
										<img src="${classpath }/FileUploads/${productImage.path }"
											class="img-fluid" style="height: 110%;" alt="Responsive image">
									</div>
								</c:forEach>
							</div>
	                    </div>
	                </div>
	                <div class="detail">
                        <h4 class="detail__heading mt-4">
                            Chi tiết sản phẩm
                        </h4>
                        <div class="detail__text" id="productDescription">
                            <p>${product.detailDescription }</p>
                        </div>
                        <button id="toggleButton" onclick="toggleDescription()">Xem thêm</button>
                    </div>    
                </div>
                <!-- cột thông tin -->
                <div class="col-lg-7">
                    <!-- Tên sp -->
                    <div class="row">
                        <div class="card" style="border: 0;">
                            <div class="card-body pt-0">
                              <h5 class="card-title product_name">${product.name }</h5>
                              <h6 class="card-subtitle mb-2 text-muted">💛💛💛💛💛 </h6>
                              <p class="card-text">${product.shortDescription }</p>
                              <div class="freeship">
                                🚍Free ship toàn quốc 
                              </div>
                            </div>
                        </div>
                    </div>

                    <!-- Giá, số lượng mua -->
                    <div class="row pl-3">
                        <div class="price" style="width: 100%;">
                            <h5 style="text-decoration: line-through; color: rgb(53, 52, 52);">
                            	<fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber>
															<sup>vnđ</sup>
							</h5>
                            <h2 style="color: red;">
                            	<fmt:formatNumber value="${product.salePrice }" minFractionDigits="0"></fmt:formatNumber>
															<sup>vnđ</sup>
							</h2>
                        </div>
                        <div class="buy" style="width: 100%;">
                            <label for="">Số lượng</label>
                            <input type="number" name="quantity" id="quantity" value="1" style="border: 1px solid black; width: 10%;">
                        </div>
                    </div>

                    <!-- Nút mua -->
                    <div class="row pl-3 mt-2 mb-3">
                        <button type="button" class="btn btn-primary">Mua ngay</button>
                        <button type="button" onclick="addToCart(${product.id }, '${product.name }')" class="btn btn-warning ml-4">Thêm vào giỏ hàng</button>
                    </div>

                    <!-- Khuyến mãi -->
                    <div class="row pl-3">
                        <h5 class="card-title">KHUYẾN MÃI</h5>
                        <fieldset>
                            <legend class="legend"><center>🎁 Mua hàng online</center></legend>
                            <label>1. Tặng tai nghe không dây trị giá 300k</label> <br>
                            <label>2. Bộ sạc nhanh trị giá 300k</label> <br>
                            <label>3. Bộ sạc không dây trị giá 300k</label> <br>
                            <label>4. Ốp lưng solicol trị giá 300k</label> <br>
                            <label>5. Phiếu giảm giá 300k cho mọi sản phẩm</label>
                        </fieldset>
                    </div>

                    
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
	
	<script type="text/javascript">
        function toggleDescription() {
            var description = document.getElementById('productDescription');
            description.classList.toggle('expanded');
            var button = document.getElementById('toggleButton');
            button.innerHTML = description.classList.contains('expanded') ? 'Thu gọn' : 'Xem thêm';
        }
    </script>
	
	
	<!-- Add to cart -->
	<script type="text/javascript">
		addToCart = function(_productId , _productName) {		
			//alert("Thêm "  + _quantity + " sản phẩm '" + _productName + "' vào giỏ hàng ");
			let data = {
				productId: _productId, //lay theo id
				quantity: jQuery("#quantity").val(),
				productName: _productName,
			};
				
			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProductsId").html(totalProducts);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert(jsonResult.code + ': Đã có lỗi xay ra...!')
				},
			});
		}
	</script>
	
	<script>
        const bigImg = document.querySelector(".main_picture img")
	    const smallImg = document.querySelectorAll(".small_img img")
	    smallImg.forEach(function(imgItem, X) {
        imgItem.addEventListener("click", function() {
            bigImg.src = imgItem.src
        })
    })
    </script>
</body>
</html>