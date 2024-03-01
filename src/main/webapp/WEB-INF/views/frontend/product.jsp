<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

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
<body id="page-top">
	<!-- Header -->
	<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

	<!-- Menu nu ngang -->
	<jsp:include page="/WEB-INF/views/frontend/layout/menu_ngang.jsp"></jsp:include>
	
	
	<!-- Jumbotron tìm kiếm -->
	<jsp:include page="/WEB-INF/views/frontend/layout/jumbotron.jsp"></jsp:include>

	<!-- Begin main -->
	<main>
		<form action="${classpath }/product" method="get">
			<div class="container-fluid p-3">
				<p class="mb-2 mt-1 pb-3">
					<a href="${classpath }/index">Trang chủ</a> > <a
						href="${classpath }/product">Cửa hàng</a>
				</p>
				<div class="row">
					<!-- Loc thong tin -->
					<div class="col-lg-3 mb-lg-0 mb-4">
						<div class="card">
							<ul class="list-group list-group-flush">
								<li class="list-group-item group-item-title">Hãng điện
									thoại</li>
								<li class="list-group-item"><select class="form-control"
									id="categoryId" name="categoryId" style="margin-right: 10px;">
										<option value="0">Chọn hãng điện thoại</option>
										<c:forEach items="${categories }" var="category">
											<option value="${category.id }">${category.name }</option>
										</c:forEach>
								</select></li>
								<%-- <c:forEach var="category" items="${categories }"
									varStatus="loop">
									<li class="list-group-item" id="categoryId" name="categoryId">
										<a href="/product/${category.id }" class="card-link">${category.name }</a>
									</li>
								</c:forEach>  --%>
								<!-- <li class="list-group-item"><a href="#" class="card-link">Apple</a></li>
								<li class="list-group-item"><a href="#" class="card-link">SamSung</a></li>
								<li class="list-group-item"><a href="#" class="card-link">XiaoMi</a></li>
								<li class="list-group-item"><a href="#" class="card-link">Oppo</a></li> -->
							</ul>
						</div>
						<div class="card mt-3">
							<ul class="list-group list-group-flush">
								<li class="list-group-item group-item-title">Lọc theo giá</li>
								<li class="list-group-item"><input type="checkbox"
									value="0-1000000" name="priceRange" id="price_1"
									<c:if test="${param.priceRange != null && param.priceRange.contains('0-1000000')}">checked</c:if>>
									<label for="price_1">0 - 1.000.000</label></li>
								<li class="list-group-item"><input type="checkbox"
									value="1000000-5000000" name="priceRange" id="price_2"
									<c:if test="${param.priceRange != null && param.priceRange.contains('1000000-5000000')}">checked</c:if>>
									<label for="price_2">1.000.000 - 5.000.000</label></li>
								<li class="list-group-item"><input type="checkbox"
									value="5000000-8000000" name="priceRange" id="price_3"
									<c:if test="${param.priceRange != null && param.priceRange.contains('5000000-8000000')}">checked</c:if>>
									<label for="price_3">5.000.000 - 8.000.000</label></li>
								<li class="list-group-item"><input type="checkbox"
									value="8000000-900000000" name="priceRange" id="price_4"
									<c:if test="${param.priceRange != null && param.priceRange.contains('8000000-900000000')}">checked</c:if>>
									<label for="price_4">8.000.000 trở lên</label></li>
							</ul>
						</div>
						<%-- <div class="card mt-3">
							<div class="list-group-item group-item-title">Lọc theo giá</div>
							<div class="row">
								<div class="col-md-5 ml-2 mt-2 mb-2">
									<input class="form-control p-0" type="text" id="beginPrice"
										name="beginPrice" value="${formattedBeginPrice }"/>
								</div>
								<div class="col-md-1 mt-2 mb-2 p-0 pl-1">To</div>
								<div class="col-md-5 mt-2 mb-2 ">
									<input class="form-control p-0" type="text" id="endPrice"
										name="endPrice" value="${formattedEndPrice }"/>
								</div>
							</div>
						</div> --%>
							<div class="card mt-3">
								<div class="list-group-item group-item-title">Khoảng năm
									ra mắt</div>
								<div class="row">
									<div class="col-md-5 ml-2 mt-2 mb-2">
										<input class="form-control p-0" type="text" id="beginYear"
											name="beginYear" />
									</div>
									<div class="col-md-1 mt-2 mb-2 p-0 pl-1">To</div>
									<div class="col-md-5 mt-2 mb-2 ">
										<input class="form-control p-0" type="text" id="endYear"
											name="endYear" />
									</div>
								</div>
							</div>
							<div class="row mt-3" style="justify-content: center;">
								<button type="submit" id="btnSearch" name="btnSearch"
									class="btn btn-primary">Search</button>
							</div>
						</div>
						<!-- Ket thuc loc thong tin -->
					

					<!-- Danh sach san pham -->
					<div class="col-lg-9">
						<div class="alert alert-primary" role="alert">
							<h1>Danh sách sản phẩm</h1>
							
							<input type="hidden" id="currentPage" name="currentPage"
								class="form-control" value="${productSearch.currentPage }">
							
							<div class="row">
								<c:forEach items="${products }" var="product">
									<!-- Sản phẩm 1 -->
									<!-- <div class="col-md-6 col-xl-4 mb-4"> -->
									<div class="col-12 col-lg-4 col-md-6 mt-1 mb-4">
										<div class="card">
											<a href="${classpath }/product-detail/${product.id}"> <img
												class="card-img-top"
												src="${classpath }/FileUploads/${product.avatar }"
												alt="avatar">
											</a>
											<div class="card-body">
												<h2 class="card-title">
													<a href="${classpath }/product-detail/${product.id}">${product.name }</a>
												</h2>
												<%-- <p class="card-text">${product.shortDescription }</p> --%>
												<p class="card-text">
													<fmt:formatNumber value="${product.salePrice }"
														minFractionDigits="0"></fmt:formatNumber>
													<sup>vnđ</sup>
												</p>
												<a class="btn btn-primary btn-block" onclick="addToCart(${product.id },1, '${product.name }')">
													Thêm vào giỏ hàng</a>
											</div>
										</div>
									</div>
								</c:forEach>
								<!-- Scroll to Top Button-->
								<a class="scroll-to-top rounded" style="margin-left: 95%"
									href="#page-top"> <i class="fas fa-angle-up" style="font-size: 30px"></i>
								</a>
							</div>
						</div>
					</div>
					<!-- Ket thuc sanh sach san pham -->
			</div>
					<div class="row">
						<!-- Phan trang -->
						<div class="col-md-12">
							<div class="pagination float-right">
								<div id="paging"></div>
							</div>
						</div>
					</div>
			
		</form>	
		
		
	</main>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
	
	<!-- Js -->
	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>

    <!-- pagination -->
	<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			//$("#status").val(${productSearch.status});
			//Dat gia tri cua category ung voi dieu kien search truoc do
			$("#categoryId").val(${productSearch.categoryId});
			//Dat gia tri cua category ung voi dieu kien search truoc do
			$("#keyword").val(${productSearch.keyword});
			//Dat gia tri cua category ung voi dieu kien search truoc do
			$("#beginYear").val(${productSearch.beginYear});
			//Dat gia tri cua category ung voi dieu kien search truoc do
			$("#endYear").val(${productSearch.endYear});
			
			$("#paging").pagination({
				currentPage: ${productSearch.currentPage}, //Trang hien tai
				items: ${productSearch.totalItems}, //Tong so san pham (total products)
				itemsOnPage: ${productSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#currentPage').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script> 
	
	<!-- Add to cart -->
	<script type="text/javascript">
		addToCart = function(_productId, _quantity, _productName) {		
			//alert("Thêm "  + _quantity + " sản phẩm '" + _productName + "' vào giỏ hàng ");
			let data = {
				productId: _productId, //lay theo id
				quantity: _quantity,
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
</body>
</html>
